import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/splash/splash_ui_state.dart';
import 'package:palmfarm/feature/splash/splash_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
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
    // TODO: implement initState
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
    return Scaffold(
      appBar: const CustomAppBar(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "기기 리스트",
      ),
      body: SafeArea(
        child: Container(
          color: Colors.yellow,
        )
      ),
    );
  }
}
