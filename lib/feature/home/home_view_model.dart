import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/feature/home/home_list_ui_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';

class HomeViewModel implements ViewModelInterface {
  final LocalRepository _localRepository;

  HomeViewModel(this._localRepository);

  final homeListUiState = ArcSubject<HomeListUiState>();

  final userIdState = ArcSubject<String>();

  void onLoadData() async {
    _localRepository.getAllPalmFarmItems().listen((event) {
      Log.d(":::event... $event");
      homeListUiState.val = HomeListUiState(items: event);
    });
  }

  Future<void> saveUserId(String userIds) async {
    await _localRepository.saveUserName(userIds: userIds);
    onLoadUserId();
  }

  void onLoadUserId() async {
    String userId = await _localRepository.getUserName();
    userIdState.val = userId;
  }

  Future<void> onUpdateDevice(PalmFarmDevice device) async =>
      await _localRepository.saveDevice(device);

  Future<void> onDeleteDevice(PalmFarmDevice device) async =>
      await _localRepository.deleteDevice(device);

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
