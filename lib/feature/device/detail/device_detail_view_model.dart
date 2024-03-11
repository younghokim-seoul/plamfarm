import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/ble_packets.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/connection_ui_state.dart';
import 'package:palmfarm/feature/device/detail/device_detail_page.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class DeviceDetailViewModel implements ViewModelInterface {
  final BleRepository _bleRepository;
  final LocalRepository _localRepository;

  DeviceDetailViewModel(this._bleRepository, this._localRepository);

  final connectionUiState = ArcSubject<ConnectionUiState>();
  final privateSettings = ArcSubject<List<PrivateSetting>>();

  void loadPrivateSetting(String address) {
    _localRepository.getAllPrivateSettingItems(address).listen((event) {
      Log.d(":::private Settings... " + event.length.toString());
      privateSettings.val = event;
    });
  }

  void connect(String address) {
    _bleRepository.startScan();
    _bleRepository.addChannelListener(DeviceDetailPage.routeName, BleChannelListener(onDeviceStatusChanged: (update) {
      Log.d(":::onDeviceStatusChanged... " + update.toString());
      switch (update.connectionState) {
        case DeviceConnectionState.connected:
          loadState(Connected());
          break;
        case DeviceConnectionState.disconnected:
          loadState(Disconnected());
          break;
        default:
          break;
      }
    },onDeviceScanDiscovered: (val) {
      Log.d(":::scanDevice " + val.toString());
      final scanDevice = val.discoveredDevices.where((element) => element.id == address).firstOrNull;

      Log.d(":::scanDevice " + scanDevice.toString());

      if (!scanDevice.isNullOrEmpty) {
        _bleRepository.stopScan();
        _bleRepository.connect(address);
      }
    }));
  }

  void write(BlePacket packet) async {
    await _bleRepository.write(Request(command: packet.command));
  }

  @override
  disposeAll() async {
    await _bleRepository.disconnect();
    connectionUiState.close();
    privateSettings.close();
    _bleRepository.removeAllChannelListener();
  }

  @override
  loadState(state) {
    if (state is ConnectionUiState) {
      connectionUiState.val = state;
    }
  }
}
