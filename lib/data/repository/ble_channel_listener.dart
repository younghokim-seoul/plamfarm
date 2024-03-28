import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';

typedef DeviceStatusEventCallback = void Function(int code,ConnectionStateUpdate channel);
typedef ScanEventCallback = void Function(BleScannerState channel);

class BleChannelListener {
  const BleChannelListener({
    this.onDeviceStatusChanged,
    this.onDeviceScanDiscovered
  });

  final DeviceStatusEventCallback? onDeviceStatusChanged;
  final ScanEventCallback? onDeviceScanDiscovered;
}
