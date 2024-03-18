import 'package:freezed_annotation/freezed_annotation.dart';


part 'device_current_state.freezed.dart';


@freezed
class DeviceCurrentState with _$DeviceCurrentState {
  factory DeviceCurrentState({
    required String currentTime,
    required String modeName,
    required String pumpOnInterval,
    required String pumpOffInterval,
    required String ledOnTime,
    required String ledOffTime,
    required String ledStatus,
    required String pumpStatus,
  }) = _DeviceCurrentState;

}
