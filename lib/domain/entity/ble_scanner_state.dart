import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_scanner_state.freezed.dart';

@freezed
class BleScannerState with _$BleScannerState {
  factory BleScannerState({
    required List<DiscoveredDevice> discoveredDevices,
    required bool scanIsInProgress,
  }) = _BleScannerState;
}