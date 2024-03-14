import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:injectable/injectable.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/parser.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/data/repository/response.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/utils/constant.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

@Singleton(as: BleRepository)
class BleRepositoryImpl extends BleRepository {
  final Map<String, BleChannelListener> _mChannelListener = Map.from({});

  final flutterReactiveBle = FlutterReactiveBle();

  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connectionSubscription;
  StreamSubscription<List<int>>? _notifySubscription;

  bool _isProcessingQueue = false;
  Completer<PalmFarmResponse> _responseCompleter = Completer();
  final _requestQueue = Queue<Future<void> Function()>();

  final _devices = <DiscoveredDevice>[];
  String? macAddress;

  @override
  Future<void> stopScan() async {
    _devices.clear();
    _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  @override
  void startScan() {
    _devices.clear();
    _scanSubscription?.cancel();
    _scanSubscription = flutterReactiveBle.scanForDevices(
        withServices: [],
        scanMode: ScanMode.lowLatency).listen((device) {
      final knownDeviceIndex = _devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        _devices[knownDeviceIndex] = device;
      } else {
        _devices.add(device);
      }
      _notifyScanScanDiscovered();
    }, onError: (Object e) => Log.e('Device scan fails with error: $e'));
    _notifyScanScanDiscovered();
  }

  @override
  Future<void> connect(String address) async {
    macAddress = address;
    _connectionSubscription = flutterReactiveBle
        .connectToDevice(id: address, connectionTimeout: Duration(seconds: 3))
        .listen(
      (update) {
        Log.d('ConnectionState for device $address : ${update.connectionState}');

        if (update.connectionState == DeviceConnectionState.connected) {
          subscribeCharacteristic();
          // readCharacteristic();
        }
        _notifyConnectionChanged(update);
      },
      onError: (Object e) =>
          Log.e('Connecting to device $address resulted in error $e'),
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
      _notifyConnectionChanged(
        ConnectionStateUpdate(
          deviceId: macAddress ?? "Unknown",
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      );
      _notifySubscription?.cancel();
      _responseCompleter = Completer();
      macAddress = null;
    }
  }

  @override
  void addChannelListener(String tag, BleChannelListener listener) {
    _mChannelListener[tag] = listener;
  }

  @override
  void removeChannelListener(String tag) {
    _mChannelListener.remove(tag);
  }

  @override
  void removeAllChannelListener() {
    _mChannelListener.clear();
  }

  Future<void> subscribeCharacteristic() async {

    await flutterReactiveBle.requestMtu(deviceId: macAddress!, mtu: 128);


    final characteristic = QualifiedCharacteristic(
      serviceId: Uuid.parse(serviceUuid),
      characteristicId: Uuid.parse(notifyUuid),
      deviceId: macAddress!,
    );
    _notifySubscription = flutterReactiveBle
        .subscribeToCharacteristic(characteristic)
        .listen((event) {
      Log.e(":::subscribeCharacteristic event... " + event.toString());
      try {
        final data = utf8.decode(event);
        _responseCompleter.complete(parseResponse(data));
      } catch (e, t) {
        _responseCompleter.completeError(BleException(e, t));
      }
      _responseCompleter = Completer();
    }, onError: (error) {
      Log.e(":::subscribeCharacteristic error... " + error);
    });
  }

  Future<void> readCharacteristic() async {
    final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(serviceUuid),
        characteristicId: Uuid.parse(notifyUuid),
        deviceId: macAddress!);
    final response =
        await flutterReactiveBle.readCharacteristic(characteristic);
    Log.d(":::::response.. " + response.toString());
  }

  void _notifyConnectionChanged(ConnectionStateUpdate state) {
    for (BleChannelListener listener in _mChannelListener.values) {
      listener.onDeviceStatusChanged?.call(state);
    }
  }

  void _notifyScanScanDiscovered() {
    for (BleChannelListener listener in _mChannelListener.values) {
      listener.onDeviceScanDiscovered?.call(BleScannerState(
        discoveredDevices: _devices,
        scanIsInProgress: _scanSubscription != null,
      ));
    }
  }

  @override
  Future<PalmFarmResponse> write(Request request) async {
    try {
      final response = await send(request: request);
      request.onResponse?.call(request.command, response);
      return response;
    } catch (e) {
      request.onError?.call(request.command, e);
      rethrow;
    }
  }

  Future<PalmFarmResponse> send({required Request request}) async {
    final completer = Completer<PalmFarmResponse>();
    _requestQueue.add(() async {
      try {
        Log.i("::[Request Queue] " + request.toString());
        final characteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse(serviceUuid),
          characteristicId: Uuid.parse(writeUuid),
          deviceId: macAddress!,
        );

        await Future.delayed(Duration(milliseconds: 200));

        await flutterReactiveBle.writeCharacteristicWithoutResponse(
          characteristic,
          value: utf8.encode(request.command),
        );
        final response = await _responseCompleter.future.timeout(Duration(seconds: 3));
        Log.d("::::결과값.. " + response.toString());
        completer.complete(response);
      } catch (e, t) {
        Log.e("::::e => " + e.toString() + " t " + t.toString());
        completer.completeError(BleException(e, t));
      }

      _responseCompleter = Completer();
    });

    if (!_isProcessingQueue) {
      unawaited(_processQueue());
    }

    return completer.future;
  }

  Future<void> _processQueue() async {
    _isProcessingQueue = true;

    while (_requestQueue.isNotEmpty) {
      final request = _requestQueue.removeFirst();
      await request();
    }

    _isProcessingQueue = false;
  }
}

class BleException implements Exception {
  const BleException(this.cause, this.stackTrace);

  final dynamic cause;
  final StackTrace stackTrace;
}
