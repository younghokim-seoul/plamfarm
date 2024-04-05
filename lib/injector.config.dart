// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:palmfarm/data/repository/ble_repository_impl.dart' as _i4;
import 'package:palmfarm/domain/repository/ble_repository.dart' as _i3;
import 'package:palmfarm/feature/splash/splash_view_model.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.BleRepository>(_i4.BleRepositoryImpl());
    gh.factory<_i5.SplashViewModel>(() => _i5.SplashViewModel());
    return this;
  }
}
