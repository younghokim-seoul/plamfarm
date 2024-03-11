import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palmfarm/data/repository/response.dart';

part 'device_current_state.freezed.dart';


@freezed
class DeviceCurrentState with _$DeviceCurrentState {
  factory DeviceCurrentState({
    required PalmFarmCurrentStatusResponse model,
  }) = _DeviceCurrentState;

}
