import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/detail/component/farming_mode_box.dart';
import 'package:palmfarm/feature/device/detail/led_setting/led_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class LedSettingViewModel implements ViewModelInterface {
  LedSettingViewModel(this._bleRepository, this._localRepository);

  final BleRepository _bleRepository;
  final LocalRepository _localRepository;

  final ledSettingState = LedSettingState(startTime: "", endTime: "").sbj;
  final ledSettingUiState = ArcSubject<LedSettingState>();

  late FarmingMode mode;
  late String address;

  void setPreset(FarmingMode mode, String address) {
    this.mode = mode;
    this.address = address;
  }

  void onLoadData() async {
    final response = await _localRepository.findPalmFarmDevice(address);

    if (!response.isNullOrEmpty) {
      Log.d("::::: response => " + response.toString());
      final model = response!;
      final time = mode.getTime(model);
      ledSettingState.val = LedSettingState(
        startTime: !time.isNullOrEmpty ? time.substring(0, 2) : "",
        endTime: !time.isNullOrEmpty ? time.substring(2, 4) : "",
      );
    }
  }

  bool isTextFormCheck(String hour, String minute) => !hour.isNullOrEmpty && !minute.isNullOrEmpty;

  Future<void> onClickOnlySave(String hour, String minute) async {
    var response = await _localRepository.findPalmFarmDevice(address);

    String hourTime = int.parse(hour).crateTime();
    String minuteTime = int.parse(minute).crateTime();
    Log.d(":::starTIme.. " + hourTime + " endTime.. " + minuteTime);

    switch (mode) {
      case FarmingMode.flowers:
        response = response!.copyWith(flowersLedTime: hourTime + minuteTime);
        break;
      case FarmingMode.strawberry:
        response = response!.copyWith(strawBerryLedTime: hourTime + minuteTime);
        break;
      case FarmingMode.vegetable:
        response = response!.copyWith(vegetableLedTime: hourTime + minuteTime);
        break;
    }

    await _localRepository.saveDevice(response);
    Log.d("::::response => " + response.toString());
  }

  void onClickOnlyDeviceSetting(String hour, String minute) {

  }

  @override
  disposeAll() {}

  @override
  loadState(state) {
    ledSettingState.close();
    ledSettingUiState.close();
  }
}

String createLedTime(int number) {
  return number.toString().padLeft(2, '0');
}

extension defaultLedTimes on FarmingMode {
  String getTime(PalmFarmDevice palmFarmDevice) {
    switch (this) {
      case FarmingMode.vegetable:
        return palmFarmDevice.vegetableLedTime;
      case FarmingMode.flowers:
        return palmFarmDevice.flowersLedTime;
      case FarmingMode.strawberry:
        return palmFarmDevice.strawBerryLedTime;
    }
  }
}
