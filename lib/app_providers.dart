import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});



final bleStatusProvider = StreamProvider<BleStatus>((ref) {
  final bleRepository = getIt<BleRepository>();
  return bleRepository.bleStatusCallback.asyncMap((event) => event);
});
