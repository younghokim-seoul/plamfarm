import 'dart:convert';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:injectable/injectable.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/ble_packets.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/device/connection_ui_state.dart';
import 'package:palmfarm/feature/device/detail/device_detail_page.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

@Injectable()
class DeviceDetailViewModel implements ViewModelInterface {
  final BleRepository _bleRepository;

  DeviceDetailViewModel(this._bleRepository);

  final connectionUiState = ArcSubject<ConnectionUiState>();

  void addBleChannelListener() {
    _bleRepository.addChannelListener(DeviceDetailPage.routeName,
        BleChannelListener(onDeviceStatusChanged: (update) {
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
    }));
  }

  void connect(String address) {
    _bleRepository.connect(address);
  }

  void write(BlePacket packet) async {
    await _bleRepository.write(utf8.encode(packet.command));
  }

  @override
  disposeAll() async {
    await _bleRepository.disconnect();
    connectionUiState.close();
    _bleRepository.removeAllChannelListener();
  }

  @override
  loadState(state) {
    if (state is ConnectionUiState) {
      connectionUiState.val = state;
    }
  }


}
