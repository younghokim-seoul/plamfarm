
import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';




@Singleton(as: BleRepository)
class BleRepositoryImpl extends BleRepository{

  final flutterReactiveBle = FlutterReactiveBle();

  @override
  Stream<DiscoveredDevice> startScan() => flutterReactiveBle.scanForDevices(withServices: [], scanMode: ScanMode.lowLatency);

}