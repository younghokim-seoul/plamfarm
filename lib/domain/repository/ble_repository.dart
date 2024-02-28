import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

abstract class BleRepository {
  Stream<DiscoveredDevice> startScan();
}