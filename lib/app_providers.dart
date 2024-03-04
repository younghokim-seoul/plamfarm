import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/data/local/palm_farm_database.dart';
import 'package:palmfarm/data/repository/local_repository_impl.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/connector/connector_view_model.dart';
import 'package:palmfarm/feature/home/home_view_model.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

final localRepositoryProvider = Provider<LocalRepository>((ref) {
  final dao = getIt.get<AppDatabase>();
  return LocalRepositoryImpl(dao.palmFarmDao);
});

final homeViewModelProvider = Provider.autoDispose<HomeViewModel>((ref) {
  final localRepository = ref.watch(localRepositoryProvider);
  return HomeViewModel(localRepository);
});

final connectorViewModelProvider = Provider.autoDispose<ConnectorViewModel>((ref) {
  final localRepository = ref.watch(localRepositoryProvider);
  return ConnectorViewModel(localRepository);
});

