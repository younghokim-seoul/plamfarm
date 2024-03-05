import 'package:injectable/injectable.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/feature/device/scan/scan_page.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

@Injectable()
class ScanViewModel implements ViewModelInterface {
  final BleRepository _bleRepository;

  ScanViewModel(this._bleRepository);


  final scanListUiState = ArcSubject<BleScannerState>(seed: BleScannerState(discoveredDevices: [], scanIsInProgress: true));

  void startScan() {
    _bleRepository.startScan();
  }

  void setScanCallback() {

    _bleRepository.addChannelListener(ScanPage.routeName,
        BleChannelListener(onDeviceScanDiscovered: (val) {
          scanListUiState.val = val;
        }));
  }

  @override
  disposeAll() async {
    Log.d(":::ScanViewModel disposeAll ");
    _bleRepository.removeChannelListener(ScanPage.routeName);
    await _bleRepository.stopScan();
  }

  @override
  loadState(state) {
    scanListUiState.val = state;
  }
}
