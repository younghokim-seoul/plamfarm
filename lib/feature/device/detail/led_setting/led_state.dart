import 'package:freezed_annotation/freezed_annotation.dart';

part 'led_state.freezed.dart';


@freezed
class LedSettingState with _$LedSettingState {
  factory LedSettingState({
    required String startTime,
    required String endTime
  }) = _LedSettingState;

}
