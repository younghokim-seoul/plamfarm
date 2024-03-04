import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connector_state.freezed.dart';

@freezed
class ConnectorState with _$ConnectorState {
  factory ConnectorState({
    required DiscoveredDevice discoveredDevices,
    required String deviceName,
  }) = _ConnectorState;
}