import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/domain/entity/ble_scanner_state.dart';
import 'package:palmfarm/domain/repository/ble_repository.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/scan/scan_page.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class ScanViewModel implements ViewModelInterface {
  ScanViewModel(this._bleRepository, this._localRepository);

  final BleRepository _bleRepository;
  final LocalRepository _localRepository;

  final scanListUiState =
      ArcSubject<BleScannerState>(seed: BleScannerState(discoveredDevices: [], scanIsInProgress: true));

  void startScan() async {
    final myDeviceList = await _localRepository.getOnceAllPalmFarmDevices();
    _bleRepository.startScan();
    _bleRepository.scanFilter(myDeviceList);
  }

  void setScanCallback() async {
    _bleRepository.addChannelListener(ScanPage.routeName, BleChannelListener(onDeviceScanDiscovered: (val) {
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



