import 'package:injectable/injectable.dart';
import 'package:palmfarm/feature/device/connector/connector_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

@Injectable()
class ConnectorViewModel implements ViewModelInterface {
  final connectorState = ArcSubject<ConnectorState>();

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
