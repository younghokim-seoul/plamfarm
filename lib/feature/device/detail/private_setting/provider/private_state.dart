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

}
