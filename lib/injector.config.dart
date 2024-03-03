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
import 'package:palmfarm/feature/device/connector/connector_view_model.dart'
    as _i5;
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart'
    as _i6;
import 'package:palmfarm/feature/device/scan/scan_view_model.dart' as _i7;

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
    gh.factory<_i5.ConnectorViewModel>(() => _i5.ConnectorViewModel());
    gh.factory<_i6.DeviceDetailViewModel>(
        () => _i6.DeviceDetailViewModel(gh<_i3.BleRepository>()));
    gh.factory<_i7.ScanViewModel>(
        () => _i7.ScanViewModel(gh<_i3.BleRepository>()));
    return this;
  }
}
