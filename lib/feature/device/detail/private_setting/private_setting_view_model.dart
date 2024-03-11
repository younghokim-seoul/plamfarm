
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';


class PrivateSettingViewModel implements ViewModelInterface{
  final BleRepository _bleRepository;
  final LocalRepository _localRepository;

  PrivateSettingViewModel(this._bleRepository,this._localRepository);

  void onLoadData() {
    _bleRepository.startScan();
  }

  @override
  disposeAll() {

  }
  @override
  loadState(state) {

  }
}
