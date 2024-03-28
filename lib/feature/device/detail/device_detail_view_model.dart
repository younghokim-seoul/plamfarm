import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/parser.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/data/repository/response.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/connection_ui_state.dart';
import 'package:palmfarm/feature/device/detail/component/device_active_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/farming_mode_box.dart';
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

  StreamSubscription? settingLiveData;

  final ledOnOff = false.sbj;
  final pumpOnOff = false.sbj;

  void loadPrivateSetting(String deviceId) {
    settingLiveData = _localRepository.getAllPrivateSettingItems(deviceId).listen((event) {
      privateSettings.val = event;
    });
  }

  void connect(String address) {
    _bleRepository.startScan();
    _bleRepository.addChannelListener(
        DeviceDetailPage.routeName,
        BleChannelListener(onDeviceStatusChanged: (code ,update) async {
          Log.d(":::onDeviceStatusChanged... " + update.toString() + " code " + code.toString());
          switch (update.connectionState) {
            case DeviceConnectionState.connected:
              await setRealCurrentTime();
              await getCurrentStatus();
              loadState(Connected());
              break;
            case DeviceConnectionState.disconnected:
              loadState(Disconnected(code: code));
              break;
            default:
              break;
          }
        }, onDeviceScanDiscovered: (val) {
          Log.d(":::scanDevice " + val.toString());
          final scanDevice = val.discoveredDevices.where((element) => element.id == address).firstOrNull;

          Log.d(":::scanDevice " + scanDevice.toString());

          if (!scanDevice.isNullOrEmpty) {
            _bleRepository.stopScan();
            _bleRepository.connect(address);
          }
        }));
  }

  Future<void> getCurrentStatus() async {
    try {
      final response = await _bleRepository.write(Request(command: queryCurrentStatus));

      if (response is PalmFarmPowerOffResponse) {
        Log.d("::::PalmFarmPowerOffResponse " + response.toString());

        if (!kReleaseMode) {
          Log.d("::::테스트 버전 일때는 직접 전원 On");
          final isPowerOn = await _bleRepository.write(Request(command: setPowerOn));

          if (isPowerOn is PalmFarmPowerOffResponse) {
            Log.d("::::isPowerOn => " + isPowerOn.toString());
            if (isPowerOn.isPowerOn) {
              getCurrentStatus();
            }
          }
        } else {
          Log.d("::::릴리즈 버전일때는 전원을 키지 않고 Disconnect 처리.");
          await _bleRepository.disconnect(code: 1);
        }
      }

      if (response is PalmFarmCurrentStatusResponse) {
        Log.d(":::PalmFarmCurrentStatusResponse " + response.toString());
        loadState(
          DeviceCurrentState(
            currentTime: response.currentTime,
            modeName: getModeName(response.currentMode),
            pumpOnInterval: response.pumpOnInterval,
            pumpOffInterval: response.pumpOffInterval,
            ledOnTime: response.ledOnTime,
            ledOffTime: response.ledOffTime,
            ledStatus: response.ledStatus,
            pumpStatus: response.pumpStatus,
          ),
        );
        pumpOnOff.val = response.pumpStatus == "1" ? true : false;
        ledOnOff.val = response.ledStatus == "1" ? true : false;
      }
    } catch (e) {
      Log.e("::::e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  Future<void> setRealCurrentTime() async {
    try {
      final data = DateTime.now().convertRTC();
      Log.d("::::data... " + data);
      final response = await _bleRepository.write(
        Request(
          command: setCurrentTime + data,
        ),
      );

      Log.d(":::[setCurrentTime] response... " + response.toString());
    } catch (e) {
      Log.e("[setRealCurrentTime] => e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  void setPrivateGrowingMode(PrivateSetting setting) async {
    Log.d("::setting.. " + setting.toString());
    if (setting.isEnableSetting()) {
      //- “AAMD/15/0930/2330/02/1530” DATA 값 해석
      // 재배모드 15(개인모드) / LED ON 시각 09:30 / LED OFF 시각 23:30 / RED LED MODE / 펌프주기 ON:15분 OFF:30분
      try {
        final privateModeIndex = '${setting.secretNumber}';
        final ledOnTime =
            setting.ledOnStartTime.toString().padLeft(2, '0') + setting.ledOnEndTime.toString().padLeft(2, '0');
        final ledOffTime =
            setting.ledOffStartTime.toString().padLeft(2, '0') + setting.ledOffEndTime.toString().padLeft(2, '0');
        final redLedMode = setting.ledMode.toString().padLeft(2, '0');
        final pumpInterval =
            setting.pumpOnInterval.toString().padLeft(2, '0') + setting.pumpOffInterval.toString().padLeft(2, '0');

        Log.d(":::redLedMode " + redLedMode);

        final response = await _bleRepository.write(
          Request(
            command: setGrowingMode + privateModeIndex + ledOnTime + ledOffTime + redLedMode + pumpInterval,
          ),
        );
        Log.d(":::setGrowingMode response... " + response.toString());
        if (response is PalmFarmSetGrowingModeResponse) {
          if (response.isSet) {
            getCurrentStatus();
          }
        }
      } catch (e) {
        Log.e("[setBaseGrowingMode] => e " + e.toString());
        await _bleRepository.disconnect();
      }
    }
  }

  void setImmediatelyLed(FarmingMode mode, String hour, String minute) async {
    try {
      final growingIndex = mode.baseGrowingModeIndex;

      String hourTime = int.parse(hour).crateTime();
      String minuteTime = int.parse(minute).crateTime();
      final growingTime = hourTime + minuteTime;
      Log.d("::::growingIndex... " + growingIndex);
      Log.d("::::growingTime... " + growingTime);
      final response = await _bleRepository.write(
        Request(
          command: setGrowingMode + growingIndex + growingTime,
        ),
      );

      Log.d(":::setImmediatelyLed response... " + response.toString());
      if (response is PalmFarmSetGrowingModeResponse) {
        if (response.isSet) {
          getCurrentStatus();
        }
      }
    } catch (e) {
      Log.e("[setBaseGrowingMode] => e " + e.toString());
      await _bleRepository.disconnect();
    }
  }

  void setBaseGrowingMode(FarmingMode mode, String deviceId) async {
    final db = await _localRepository.findPalmFarmDevice(deviceId);

    if (!db.isNullOrEmpty) {
      try {
        final growingIndex = mode.baseGrowingModeIndex;
        final growingTime = mode.getGrowingTime(db!);
        Log.d("::::growingIndex... " + growingIndex);
        Log.d("::::growingTime... " + growingTime);
        final response = await _bleRepository.write(
          Request(
            command: setGrowingMode + growingIndex + growingTime,
          ),
        );

        Log.d(":::setBaseGrowingMode response... " + response.toString());
        if (response is PalmFarmSetGrowingModeResponse) {
          if (response.isSet) {
            getCurrentStatus();
          }
        }
      } catch (e) {
        Log.e("[setBaseGrowingMode] => e " + e.toString());
        await _bleRepository.disconnect();
      }
    }
  }

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

  String getModeName(String modeIndex) {
    if (int.parse(modeIndex) <= 3) {
      return modeIndex.growingMode;
    } else {
      return (privateSettings.val as List<PrivateSetting>)
          .where((element) => int.parse(modeIndex) == element.secretNumber)
          .first
          .modeName;
    }
  }

  @override
  disposeAll() async {
    await _bleRepository.disconnect();
    settingLiveData?.cancel();
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
