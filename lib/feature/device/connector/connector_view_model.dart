import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/device/connector/connector_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class ConnectorViewModel implements ViewModelInterface {
  final LocalRepository _localRepository;

  ConnectorViewModel(this._localRepository);

  final connectorState = ArcSubject<ConnectorState>();

  Future<void> saveConnectorDevice(String reNameDevice) async {
      final state = connectorState.val as ConnectorState;
      return await _localRepository.save(
        PalmFarmDevice.create(
          macAddress: state.discoveredDevices.id,
          reName: reNameDevice.isNullOrEmpty ? state.discoveredDevices.name : reNameDevice,
          originName: state.discoveredDevices.name,
        ),
      );

  }

  @override
  disposeAll() {
    Log.d(":::ConnectorViewModel disposeAll");
    connectorState.close();
  }

  @override
  loadState(state) {
    connectorState.val = state;
  }
}
