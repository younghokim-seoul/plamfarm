import 'package:injectable/injectable.dart';
import 'package:palmfarm/feature/splash/splash_ui_state.dart';
import 'package:palmfarm/feature/viewmodel_interface.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/reactive/arc_subject.dart';


@injectable
class SplashViewModel implements ViewModelInterface {


  final splashUiState = ArcSubject<SplashUiState>();

  void onLoadData() => Future.delayed(const Duration(seconds: 2)).then((value) => loadState(NavigateToPage()));

  @override
  disposeAll() {
    Log.d(":::SplashViewModel disposeAll");
    splashUiState.close();
  }

  @override
  loadState(state) {
    splashUiState.val = state;
  }
}
