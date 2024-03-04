import 'package:auto_route/auto_route.dart';
import 'package:palmfarm/feature/device/connector/connector_page.dart';
import 'package:palmfarm/feature/device/detail/device_detail_page.dart';
import 'package:palmfarm/feature/device/scan/scan_page.dart';
import 'package:palmfarm/feature/home/home_page.dart';
import 'package:palmfarm/feature/splash/splash_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: SplashPage.routeName,
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: HomePage.routeName,
          page: HomeRoute.page,
        ),
        CupertinoRoute(
          path: ConnectorPage.routeName,
          page: ConnectorRoute.page,
        ),
        CupertinoRoute(
          path: ScanPage.routeName,
          page: ScanRoute.page,
        ),
        CupertinoRoute(
          path: ScanPage.routeName,
          page: ScanRoute.page,
        ),
        CupertinoRoute(
          path: DeviceDetailPage.routeName,
          page: DeviceDetailRoute.page,
        )
      ];
}
