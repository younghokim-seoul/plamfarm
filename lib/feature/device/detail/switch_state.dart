import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_state.freezed.dart';


@freezed
class SwitchState with _$SwitchState {
  factory SwitchState({
    required bool enableLed,
    required bool enablePump,
  }) = _SwitchState;

}
