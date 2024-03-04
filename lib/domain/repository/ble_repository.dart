import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';


abstract class BleRepository {
  void startScan();
  Future<void> stopScan();
  Future<void> connect(String address);
  Future<void> disconnect();

  Stream<BleScannerState> get scanCallback;
  Stream<BleStatus> get bleStatusCallback;

}