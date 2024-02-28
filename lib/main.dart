import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/app_providers.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_theme.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),	   // 피그마에 디자인된 앱 프레임 사이즈로 맞춰서 적용하면 됨
      minTextAdapt: true,       // 텍스트 크기를 자동으로 조정하여 화면에 맞추는 기능을 활성화
      splitScreenMode: true,    //분할 모드 활성화
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: PlamFarmTheme.lightThemeData,
        darkTheme: PlamFarmTheme.darkThemeData,
        routerConfig: ref.watch(routerProvider).config(),
        themeMode: ThemeMode.light,
        builder: (context, child) {
          final theme = Theme.of(context);
          final colors = theme.extension<GyverLampAppTheme>()!;
          final brightness = theme.brightness;

          final overlayStyle = brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle.copyWith(
              statusBarColor: Colors.white,

              systemNavigationBarColor: colors.background,
              systemNavigationBarIconBrightness:
              brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
            ),
            child: child!,
          );
        },

      ),
    );
  }
}

