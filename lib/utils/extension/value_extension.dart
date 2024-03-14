import 'package:flutter/material.dart';
import 'package:palmfarm/assets/assets.gen.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/feature/device/detail/component/farming_mode_box.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';

extension CheckValues<T> on T {
  /// String, List, Map : not null / not empty check
  /// strVariable.hasValue ? print("good") : print("bad")
  bool get hasValue => !(this == null ||
      ((this is String && (this as String).isEmpty) ||
          (this is List && (this as List).isEmpty) ||
          (this is Map && (this as Map).isEmpty)));

  /// String, List, Map : null / empty check
  /// strVariable.isNullOrEmpty? print("bad") : print("good")
  bool get isNullOrEmpty =>
      this == null ||
      ((this is String && (this as String).isEmpty) ||
          (this is List && (this as List).isEmpty) ||
          (this is Map && (this as Map).isEmpty));
}

extension StringToMap on String {
  bool toBoolean() {
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0"
            ? false
            : throw ArgumentError('Invalid request body "$this".'));
  }
}

extension DateTimeExtensions on DateTime {
  String getKey() {
    return "$year년 $month월 $day일";
  }

  String convertRTC() {
    return this.hour.toString().padLeft(2, '0') +
        this.minute.toString().padLeft(2, '0') +
        this.second.toString().padLeft(2, '0');
  }
}

extension ConvertPacketDateTime on int {
  String crateTime() {
    return this.toString().padLeft(2, '0');
  }
}

extension CheckPrivateSettingExtensions on PrivateSetting {
  bool isEnableSetting() {
    List<bool> checks = [true, true];

    if (this.modeName.isNullOrEmpty) {
      checks[0] = false;
    }

    if ([
      this.pumpOnInterval,
      this.pumpOffInterval,
      this.ledOnStartTime,
      this.ledOnEndTime,
      this.ledOffStartTime,
      this.ledOffStartTime
    ].contains(-1)) {
      checks[1] = false;
    }

    bool allTrue = checks.every((element) => element);
    return allTrue;
  }
}

extension FarmingModeExtension on FarmingMode {
  Color get color {
    switch (this) {
      case FarmingMode.vegetable:
        return PlamFarmColors.palmFarmPrimary3;
      case FarmingMode.strawberry:
        return PlamFarmColors.palmFarmPrimary10;
      case FarmingMode.flowers:
        return PlamFarmColors.palmFarmPrimary4;
    }
  }

  AssetGenImage get image {
    switch (this) {
      case FarmingMode.vegetable:
        return Assets.image.icVegetableMode;
      case FarmingMode.strawberry:
        return Assets.image.icStrawberryMode;
      case FarmingMode.flowers:
        return Assets.image.icFlowersMode;
    }
  }

  String get title {
    switch (this) {
      case FarmingMode.vegetable:
        return "채소 모드";
      case FarmingMode.strawberry:
        return "딸기 모드";
      case FarmingMode.flowers:
        return "화훼 모드";
    }
  }

  String get baseGrowingModeIndex {
    switch (this) {
      case FarmingMode.vegetable:
        return "01";
      case FarmingMode.strawberry:
        return "02";
      case FarmingMode.flowers:
        return "03";
    }
  }

  String getGrowingTime(PalmFarmDevice palmFarmDevice) {
    switch (this) {
      case FarmingMode.vegetable:
        return palmFarmDevice.vegetableLedTime.isNullOrEmpty
            ? "0700"
            : palmFarmDevice.vegetableLedTime;
      case FarmingMode.strawberry:
        return palmFarmDevice.strawBerryLedTime.isNullOrEmpty
            ? "0700"
            : palmFarmDevice.strawBerryLedTime;
      case FarmingMode.flowers:
        return palmFarmDevice.flowersLedTime.isNullOrEmpty
            ? "0700"
            : palmFarmDevice.flowersLedTime;
    }
  }
}
