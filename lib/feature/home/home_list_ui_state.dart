import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';

part 'home_list_ui_state.freezed.dart';

@freezed
class HomeListUiState with _$HomeListUiState {
  factory HomeListUiState({
    required List<PalmFarmDevice> items,
  }) = _HomeListUiState;
}