import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/main.dart';
import 'package:palmfarm/utils/constant.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

@Singleton(as: BleRepository)
class BleRepositoryImpl extends BleRepository {
  final flutterReactiveBle = FlutterReactiveBle();


  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connectionSubscription;


  final StreamController<BleScannerState> _scanStateStreamController = StreamController.broadcast();


  final _devices = <DiscoveredDevice>[];

  String? macAddress;
  ConnectionStateUpdate? currentDeviceState;

  @override
  Future<void> stopScan() async {
    _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  @override
  void startScan() {
    _devices.clear();
    _scanSubscription?.cancel();
    _scanSubscription = flutterReactiveBle
        .scanForDevices(withServices: [Uuid.parse(serviceUuid)], scanMode: ScanMode.lowLatency).listen((device) {
      Log.d(":::Device... $device");
      final knownDeviceIndex = _devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        _devices[knownDeviceIndex] = device;
      } else {
        _devices.add(device);
      }

      _pushScanState();
    }, onError: (Object e) => Log.e('Device scan fails with error: $e'));
    _pushScanState();
  }

  @override
  Future<void> connect(String address) async {
    macAddress = address;
    _connectionSubscription = flutterReactiveBle.connectToDevice(id: address).listen(
      (update) {
        Log.d('ConnectionState for device $address : ${update.connectionState}');
        eventBus.fire(update);
      },
      onError: (Object e) => Log.e('Connecting to device $address resulted in error $e'),
    );
  }

  @override
  Future<void> disconnect() async {
    if (macAddress.isNullOrEmpty) {
      Log.d('not connect to device');
      return;
    }

    try {
      Log.d('disconnecting to device: $macAddress');
      await _connectionSubscription?.cancel();
    } on Exception catch (e, _) {
      Log.e("Error disconnecting from a device: $e");
    } finally {
      eventBus.fire(
        ConnectionStateUpdate(
          deviceId: macAddress ?? "Unknown",
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      );
      macAddress = null;
    }
  }

  @override
  Stream<BleScannerState> get scanCallback => _scanStateStreamController.stream;

  @override
  Stream<BleStatus> get bleStatusCallback => flutterReactiveBle.statusStream;


  void _pushScanState() => _scanStateStreamController.add(
    BleScannerState(
      discoveredDevices: _devices,
      scanIsInProgress: _scanSubscription != null,
    ),
  );
}
