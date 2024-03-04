import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

@Injectable()
class ScanViewModel implements ViewModelInterface {
  final BleRepository _bleRepository;

  ScanViewModel(this._bleRepository);

  StreamSubscription? _scanCallback;

  final scanListUiState =
      ArcSubject<BleScannerState>(seed: BleScannerState(discoveredDevices: [], scanIsInProgress: true));

  void startScan() {
    _bleRepository.startScan();
    _scanCallback = _bleRepository.scanCallback.listen((event) => scanListUiState.val = event);
  }

  @override
  disposeAll() async {
    Log.d(":::ScanViewModel disposeAll ");
    await _scanCallback?.cancel();
    await _bleRepository.stopScan();
  }

  @override
  loadState(state) {
    scanListUiState.val = state;
  }
}
