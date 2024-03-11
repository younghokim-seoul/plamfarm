import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/home/home_list_ui_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class HomeViewModel implements ViewModelInterface {
  final LocalRepository _localRepository;

  HomeViewModel(this._localRepository);

  final homeListUiState = ArcSubject<HomeListUiState>();

  void onLoadData() async {
    _localRepository.getAllPalmFarmItems().listen((event) {
      Log.d(":::event... $event");
      homeListUiState.val = HomeListUiState(items: event);
    });
  }
  @override
  disposeAll() {
    Log.d(":::HomeViewModel disposeAll");
    homeListUiState.close();
  }

  @override
  loadState(state) {
    homeListUiState.val = state;
  }
}
