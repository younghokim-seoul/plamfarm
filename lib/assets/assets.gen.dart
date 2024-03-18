/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/app_landing.jpg
  AssetGenImage get appLanding =>
      const AssetGenImage('assets/image/app_landing.jpg');

  /// File path: assets/image/ic_banner.jpg
  AssetGenImage get icBanner =>
      const AssetGenImage('assets/image/ic_banner.jpg');

  /// File path: assets/image/ic_ble.png
  AssetGenImage get icBle => const AssetGenImage('assets/image/ic_ble.png');

  /// File path: assets/image/ic_device.jpg
  AssetGenImage get icDevice =>
      const AssetGenImage('assets/image/ic_device.jpg');

  /// File path: assets/image/ic_flowers_mode.png
  AssetGenImage get icFlowersMode =>
      const AssetGenImage('assets/image/ic_flowers_mode.png');

  /// File path: assets/image/ic_strawberry_mode.png
  AssetGenImage get icStrawberryMode =>
      const AssetGenImage('assets/image/ic_strawberry_mode.png');

  /// File path: assets/image/ic_title_device.jpg
  AssetGenImage get icTitleDevice =>
      const AssetGenImage('assets/image/ic_title_device.jpg');

  /// File path: assets/image/ic_vegetable_mode.png
  AssetGenImage get icVegetableMode =>
      const AssetGenImage('assets/image/ic_vegetable_mode.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appLanding,
        icBanner,
        icBle,
        icDevice,
        icFlowersMode,
        icStrawberryMode,
        icTitleDevice,
        icVegetableMode
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
