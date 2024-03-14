// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ConnectorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectorPage(),
      );
    },
    DeviceDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DeviceDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeviceDetailPage(
          key: args.key,
          palmFarmDevice: args.palmFarmDevice,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LedSettingRoute.name: (routeData) {
      final args = routeData.argsAs<LedSettingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LedSettingPage(
          key: args.key,
          mode: args.mode,
          deviceId: args.deviceId,
        ),
      );
    },
    PrivateSettingRoute.name: (routeData) {
      final args = routeData.argsAs<PrivateSettingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrivateSettingPage(
          key: args.key,
          privateSetting: args.privateSetting,
        ),
      );
    },
    ScanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScanPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [ConnectorPage]
class ConnectorRoute extends PageRouteInfo<void> {
  const ConnectorRoute({List<PageRouteInfo>? children})
      : super(
          ConnectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeviceDetailPage]
class DeviceDetailRoute extends PageRouteInfo<DeviceDetailRouteArgs> {
  DeviceDetailRoute({
    Key? key,
    required PalmFarmDevice palmFarmDevice,
    List<PageRouteInfo>? children,
  }) : super(
          DeviceDetailRoute.name,
          args: DeviceDetailRouteArgs(
            key: key,
            palmFarmDevice: palmFarmDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'DeviceDetailRoute';

  static const PageInfo<DeviceDetailRouteArgs> page =
      PageInfo<DeviceDetailRouteArgs>(name);
}

class DeviceDetailRouteArgs {
  const DeviceDetailRouteArgs({
    this.key,
    required this.palmFarmDevice,
  });

  final Key? key;

  final PalmFarmDevice palmFarmDevice;

  @override
  String toString() {
    return 'DeviceDetailRouteArgs{key: $key, palmFarmDevice: $palmFarmDevice}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LedSettingPage]
class LedSettingRoute extends PageRouteInfo<LedSettingRouteArgs> {
  LedSettingRoute({
    Key? key,
    required FarmingMode mode,
    required String deviceId,
    List<PageRouteInfo>? children,
  }) : super(
          LedSettingRoute.name,
          args: LedSettingRouteArgs(
            key: key,
            mode: mode,
            deviceId: deviceId,
          ),
          initialChildren: children,
        );

  static const String name = 'LedSettingRoute';

  static const PageInfo<LedSettingRouteArgs> page =
      PageInfo<LedSettingRouteArgs>(name);
}

class LedSettingRouteArgs {
  const LedSettingRouteArgs({
    this.key,
    required this.mode,
    required this.deviceId,
  });

  final Key? key;

  final FarmingMode mode;

  final String deviceId;

  @override
  String toString() {
    return 'LedSettingRouteArgs{key: $key, mode: $mode, deviceId: $deviceId}';
  }
}

/// generated route for
/// [PrivateSettingPage]
class PrivateSettingRoute extends PageRouteInfo<PrivateSettingRouteArgs> {
  PrivateSettingRoute({
    Key? key,
    required PrivateSetting privateSetting,
    List<PageRouteInfo>? children,
  }) : super(
          PrivateSettingRoute.name,
          args: PrivateSettingRouteArgs(
            key: key,
            privateSetting: privateSetting,
          ),
          initialChildren: children,
        );

  static const String name = 'PrivateSettingRoute';

  static const PageInfo<PrivateSettingRouteArgs> page =
      PageInfo<PrivateSettingRouteArgs>(name);
}

class PrivateSettingRouteArgs {
  const PrivateSettingRouteArgs({
    this.key,
    required this.privateSetting,
  });

  final Key? key;

  final PrivateSetting privateSetting;

  @override
  String toString() {
    return 'PrivateSettingRouteArgs{key: $key, privateSetting: $privateSetting}';
  }
}

/// generated route for
/// [ScanPage]
class ScanRoute extends PageRouteInfo<void> {
  const ScanRoute({List<PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
