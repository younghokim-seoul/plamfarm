import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return MaterialApp.router(
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
            systemNavigationBarColor: colors.background,
            systemNavigationBarIconBrightness:
            brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
          ),
          child: child!,
        );
      },

    );
  }
}

