import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/parser.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/data/repository/response.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/connection_ui_state.dart';
import 'package:palmfarm/feature/device/detail/device_current_state.dart';
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
  final deviceCurrentStateUiState = ArcSubject<DeviceCurrentState>();
  final privateSettings = ArcSubject<List<PrivateSetting>>();

  final ledOnOff = false.sbj;
  final pumpOnOff = false.sbj;

  void onChangeLedStatus(bool isOn) async {
    Log.d("::onChangeLedStatus " + isOn.toString());

    try {
      final response = await _bleRepository.write(
        Request(
          command: isOn ? setLedOn : setLedOff,
        ),
      );

      if (response is PalmFarmUnknownResponse) {
        ledOnOff.val = response.data == setLedOn ? true : false;
      }
    } catch (e) {
      Log.e("[onChangeLedStatus] => e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  void onChangePumpStatus(bool isOn) async {
    Log.d("::onChangePumpStatus " + isOn.toString());
    try {
      final response = await _bleRepository.write(
        Request(
          command: isOn ? setPumpOn : setPumpOff,
        ),
      );

      if (response is PalmFarmUnknownResponse) {
        pumpOnOff.val = response.data == setPumpOn ? true : false;
      }
    } catch (e) {
      Log.e("[onChangePumpStatus] => e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  void loadPrivateSetting(String address) {
    _localRepository.getAllPrivateSettingItems(address).listen((event) {
      Log.d(":::private Settings... " + event.length.toString());
      privateSettings.val = event;
    });
  }

  void connect(String address) {
    _bleRepository.startScan();
    _bleRepository.addChannelListener(
        DeviceDetailPage.routeName,
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
        }, onDeviceScanDiscovered: (val) {
          Log.d(":::scanDevice " + val.toString());
          final scanDevice = val.discoveredDevices
              .where((element) => element.id == address)
              .firstOrNull;

          Log.d(":::scanDevice " + scanDevice.toString());

          if (!scanDevice.isNullOrEmpty) {
            _bleRepository.stopScan();
            _bleRepository.connect(address);
          }
        }));
  }

  void getCurrentStatus() async {
    try {
      final response =
          await _bleRepository.write(Request(command: queryCurrentStatus));

      if (response is PalmFarmPowerOffResponse) {
        if (response.isPowerOn) {
          getCurrentStatus();
        } else {
          Log.i("::켜줘 야됨..");
          await _bleRepository.write(Request(command: setPowerOn));
        }
      }

      if (response is PalmFarmCurrentStatusResponse) {
        loadState(DeviceCurrentState(model: response));
        pumpOnOff.val = response.pumpStatus == "1" ? true : false;
        ledOnOff.val = response.ledStatus == "1" ? true : false;
      }
    } catch (e) {
      Log.e("::::e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  @override
  disposeAll() async {
    await _bleRepository.disconnect();
    connectionUiState.close();
    privateSettings.close();
    deviceCurrentStateUiState.close();
    pumpOnOff.close();
    ledOnOff.close();
    _bleRepository.removeAllChannelListener();
  }

  @override
  loadState(state) {
    if (state is ConnectionUiState) {
      connectionUiState.val = state;
    }

    if (state is DeviceCurrentState) {
      deviceCurrentStateUiState.val = state;
    }
  }
}
