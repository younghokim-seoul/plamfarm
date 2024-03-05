
import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';

@Injectable()
class DeviceDetailViewModel implements ViewModelInterface{
  final BleRepository _bleRepository;

  DeviceDetailViewModel(this._bleRepository);

  void connect(String address) {
    _bleRepository.connect(address);
  }


  @override
  disposeAll() {

  }
  @override
  loadState(state) {

  }
}
