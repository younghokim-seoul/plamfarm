import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/detail/private_setting/provider/private_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class PrivateSettingViewModel implements ViewModelInterface {
  PrivateSettingViewModel(this._bleRepository, this._localRepository);

  final BleRepository _bleRepository;
  final LocalRepository _localRepository;

  var currentPrivateSetting = PrivateSettingState.create();
  var privateUiSettingState = ArcSubject<PrivateSettingState>();

  var isUpdateState = ArcSubject<bool>(seed: false);


  Future<void> savePrivateSetting(PrivateSetting setting) async{
    return await _localRepository.savePrivateSetting(setting);
  }

  void setPrivateSetting(PrivateSetting model) {
    Log.d("::::PrivateSetting .. " + model.toString());
    currentPrivateSetting = currentPrivateSetting.copyWith(
      modeName: model.modeName,
      ledMode: model.ledMode,
      pumpOnInterval: model.pumpOnInterval,
      pumpOffInterval: model.pumpOffInterval,
      ledOnHour: model.ledOnStartTime,
      ledOnMinute: model.ledOnEndTime,
      ledOffHour: model.ledOffStartTime,
      ledOffMinute: model.ledOffEndTime,
    );
    isUpdateState.val = model.isEnableSetting();
    _calLedLiveTime();
  }

  PrivateSettingState get() => currentPrivateSetting;

  void onChangedLedMode(int mode) {
    Log.d("::onChangedLedMode.. " +  mode.toString());
    currentPrivateSetting = currentPrivateSetting.copyWith(ledMode: mode);
    loadState(currentPrivateSetting);
  }

  void setLedOnHour(String interval) {
    if (!interval.isNullOrEmpty) {
      currentPrivateSetting = currentPrivateSetting.copyWith(ledOnHour: int.parse(interval));
      _calLedLiveTime();
    }
  }

  void setLedOnMinute(String interval) {
    if (!interval.isNullOrEmpty) {
      currentPrivateSetting = currentPrivateSetting.copyWith(ledOnMinute: int.parse(interval));
      _calLedLiveTime();
    }
  }

  void setLedOffHour(String interval) {
    if (!interval.isNullOrEmpty) {
      currentPrivateSetting = currentPrivateSetting.copyWith(ledOffHour: int.parse(interval));
      _calLedLiveTime();
    }
  }

  void setLedOffMinute(String interval) {
    if (!interval.isNullOrEmpty) {
      currentPrivateSetting = currentPrivateSetting.copyWith(ledOffMinute: int.parse(interval));
      _calLedLiveTime();
    }
  }

  void _calLedLiveTime() {
    _calculateLedOnOffDuration(
      currentPrivateSetting.ledOnHour,
      currentPrivateSetting.ledOnMinute,
      currentPrivateSetting.ledOffHour,
      currentPrivateSetting.ledOffMinute,
    );
  }

  void _calculateLedOnOffDuration(
      int onHour, int onMinute, int offHour, int offMinute) {
    Log.d("_calculate ${onHour}|${onMinute}|${offHour}|${offMinute}");
    if (onHour == -1 || onMinute == -1 || offHour == -1 || offMinute == -1) {
      return;
    }
    // 시간을 분으로 변환
    int onTimeInMinutes = onHour * 60 + onMinute;
    int offTimeInMinutes = offHour * 60 + offMinute;

    // LED OFF 시간에서 LED ON 시간을 뺌
    int durationInMinutes = offTimeInMinutes - onTimeInMinutes;

    // 음수 값이 나오면 24시간을 더함
    if (durationInMinutes < 0) {
      durationInMinutes += 24 * 60;
    }

    // 결과 시간과 분으로 다시 변환
    int durationHours = durationInMinutes ~/ 60;
    int durationMinutes = durationInMinutes % 60;

    // 결과 문자열 형식으로 변환
    String result =
        "${durationHours.toString().padLeft(2, '0')}시간${durationMinutes.toString().padLeft(2, '0')}분";
    currentPrivateSetting = currentPrivateSetting.copyWith(ledLiveTime: result);
    loadState(currentPrivateSetting);

    Log.d("::::privateUiSetting... " + result);
  }

  void onLoadData() {
    _bleRepository.startScan();
  }

  @override
  disposeAll() {}

  @override
  loadState(state) {
    privateUiSettingState.val = state;
  }
}
