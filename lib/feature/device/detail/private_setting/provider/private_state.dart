import 'package:freezed_annotation/freezed_annotation.dart';

part 'private_state.freezed.dart';


@freezed
class PrivateSettingState with _$PrivateSettingState {
  factory PrivateSettingState({
    required String modeName,
    required int ledMode,
    required int pumpOnInterval,
    required int pumpOffInterval,
    required int ledOnHour,
    required int ledOnMinute,
    required int ledOffHour,
    required int ledOffMinute,
    required String ledLiveTime,
  }) = _PrivateSettingState;


  factory PrivateSettingState.create() =>
      PrivateSettingState(
        modeName: "",
        ledMode: 1,
        pumpOnInterval: -1,
        pumpOffInterval: -1,
        ledOnHour: -1,
        ledOnMinute: -1,
        ledOffHour: -1,
        ledOffMinute: -1,
        ledLiveTime: "00시간 00분",
      );
}
