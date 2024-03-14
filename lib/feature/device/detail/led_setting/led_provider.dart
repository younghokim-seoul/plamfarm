import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/device/detail/led_setting/led_state.dart';
import 'package:palmfarm/utils/dev_log.dart';

final ledStateProvider =
    StateNotifierProvider.autoDispose<LedSettingNotifier, LedSettingState>((ref) => LedSettingNotifier());

class LedSettingNotifier extends StateNotifier<LedSettingState> {
  LedSettingNotifier()
      : super(
          LedSettingState(
            startTime: "",
            endTime: "",
          ),
        );

  void setLedSettingModel(String startTime, String endTime) {
    Log.d(":::startTime... " + startTime + " endTime.. " + endTime);
    state = state.copyWith(startTime: startTime, endTime: endTime);
  }

  void onChangedStartTime(String time) {
    state = state.copyWith(startTime: time);
  }

  void onChangedEndTime(String time) {
    state = state.copyWith(endTime: time);
  }


}
