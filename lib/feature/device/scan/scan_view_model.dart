import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';

@Injectable()
class ScanViewModel implements ViewModelInterface {
  final BleRepository _bleRepository;

  ScanViewModel(this._bleRepository);

  StreamSubscription? _subscription;

  void startScan() {
    _subscription?.cancel();
    _subscription = _bleRepository.startScan().listen(
      (device) {
        Log.i("device... $device");
      },
      onError: (Object e) => Log.e('Device scan fails with error: $e'),
    );
  }

  @override
  disposeAll() {
    _subscription?.cancel();
  }

  @override
  loadState(state) {}
}
