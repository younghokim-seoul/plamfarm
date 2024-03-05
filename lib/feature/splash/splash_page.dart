import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/assets/assets.gen.dart';
import 'package:palmfarm/feature/splash/splash_ui_state.dart';
import 'package:palmfarm/feature/splash/splash_view_model.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  final _viewModel = getIt<SplashViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.onLoadData();
    _viewModel.splashUiState.stream.listen((event) {
      if (event is NavigateToPage) {
        context.router.replace(const HomeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: AspectRatio(
            aspectRatio: 0.5,
            child: ColoredBox(
              color: Colors.transparent,
              child: Assets.image.appLanding.image(),
            ),
          ),
        ),
      ),
    );
  }
}
