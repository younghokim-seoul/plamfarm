import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
