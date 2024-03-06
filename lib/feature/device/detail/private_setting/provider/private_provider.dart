import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/device/detail/private_setting/provider/private_state.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

final privateStateProvider = StateNotifierProvider.autoDispose<
    PrivateSettingNotifier,
    PrivateSettingState>((ref) => PrivateSettingNotifier());

class PrivateSettingNotifier extends StateNotifier<PrivateSettingState> {
  PrivateSettingNotifier()
      : super(
          PrivateSettingState(
            ledMode: 0,
            pumpOnInterval: -1,
            pumpOffInterval: -1,
            ledOnHour: -1,
            ledOnMinute: -1,
            ledOffHour: -1,
            ledOffMinute: -1,
            ledLiveTime: "00시간 00분",
          ),
        );

  void onChangedLedMode(int mode) {
    state = state.copyWith(ledMode: mode);
  }

  void setPumpOnInterval(String interval) {
    state = state.copyWith(pumpOnInterval: int.parse(interval));
  }

  void setPumpOffInterval(String interval) {
    state = state.copyWith(pumpOffInterval: int.parse(interval));
  }

  void setLedOnHour(String interval) {
    if (!interval.isNullOrEmpty) {
      state = state.copyWith(ledOnHour: int.parse(interval));
      calLedLiveTime();
    }
  }

  void setLedOnMinute(String interval) {
    if (!interval.isNullOrEmpty) {
      state = state.copyWith(ledOnMinute: int.parse(interval));
      calLedLiveTime();
    }
  }

  void setLedOffHour(String interval) {
    if (!interval.isNullOrEmpty) {
      state = state.copyWith(ledOffHour: int.parse(interval));
      calLedLiveTime();
    }
  }

  void setLedOffMinute(String interval) {
    if (!interval.isNullOrEmpty) {
      state = state.copyWith(ledOffMinute: int.parse(interval));
      calLedLiveTime();
    }
  }

  void calLedLiveTime() {
    _calculateLedOnOffDuration(state.ledOnHour, state.ledOnMinute,
        state.ledOffHour, state.ledOffMinute);
  }

  void _calculateLedOnOffDuration(
      int onHour, int onMinute, int offHour, int offMinute) {

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
    state = state.copyWith(ledLiveTime: result);
  }
}
