
import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';

@Injectable()
class PrivateSettingViewModel implements ViewModelInterface{
  final BleRepository _bleRepository;

  PrivateSettingViewModel(this._bleRepository);

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
