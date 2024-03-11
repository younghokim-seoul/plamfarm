import 'package:floor/floor.dart';

@entity
class PrivateSetting {
  @primaryKey
  final String deviceCode;
  final String macAddress;
  final String modeName;
  final int ledMode;
  final int pumpOnInterval;
  final int pumpOffInterval;
  final int ledOnStartTime;
  final int ledOnEndTime;
  final int ledOffStartTime;
  final int ledOffEndTime;
  final int secretNumber;

  PrivateSetting(
      this.deviceCode,
      this.macAddress,
      this.modeName,
      this.ledMode,
      this.pumpOnInterval,
      this.pumpOffInterval,
      this.ledOnStartTime,
      this.ledOnEndTime,
      this.ledOffStartTime,
      this.ledOffEndTime,
      this.secretNumber);

  factory PrivateSetting.create({
    required String deviceCode,
    required String macAddress,
    String? modeName,
    int? ledMode,
    int? pumpOnInterval,
    int? pumpOffInterval,
    int? ledOnStartTime,
    int? ledOnEndTime,
    int? ledOffStartTime,
    int? ledOffEndTime,
    required int secretNumber,
  }) =>
      PrivateSetting(
        deviceCode,
        macAddress,
        modeName ?? "",
        ledMode ?? 0,
        pumpOnInterval ?? -1,
        pumpOffInterval ?? -1,
        ledOnStartTime ?? -1,
        ledOnEndTime ?? -1,
        ledOffStartTime ?? -1,
        ledOffEndTime ?? -1,
        secretNumber,
      );

  PrivateSetting copyWith({
    String? deviceCode,
    String? macAddress,
    String? modeName,
    int? ledMode,
    int? pumpOnInterval,
    int? pumpOffInterval,
    int? ledOnStartTime,
    int? ledOnEndTime,
    int? ledOffStartTime,
    int? ledOffEndTime,
    int? secretNumber,
  }) {
    return PrivateSetting(
      deviceCode ?? this.deviceCode,
      macAddress ?? this.macAddress,
      modeName ?? this.modeName,
      ledMode ?? this.ledMode,
      pumpOnInterval ?? this.pumpOnInterval,
      pumpOffInterval ?? this.pumpOffInterval,
      ledOnStartTime ?? this.ledOnStartTime,
      ledOnEndTime ?? this.ledOnEndTime,
      ledOffStartTime ?? this.ledOffStartTime,
      ledOffEndTime ?? this.ledOffEndTime,
      secretNumber ?? this.secretNumber,
    );
  }

  @override
  String toString() {
    return 'PrivateSetting{deviceCode: $deviceCode, macAddress: $macAddress, '
        'modeName: $modeName,ledMode: $ledMode'
        ',pumpOnInterval: $pumpOnInterval,pumpOffInterval: $pumpOffInterval'
        ',ledOnStartTime: $ledOnStartTime,ledOnEndTime: $ledOnEndTime,'
        'ledOffStartTime: $ledOffStartTime,ledOffEndTime: $ledOffEndTime,'
        'secretNumber: $secretNumber}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PrivateSetting &&
            runtimeType == other.runtimeType &&
            deviceCode == other.deviceCode &&
            macAddress == other.macAddress &&
            modeName == other.modeName &&
            ledMode == other.ledMode &&
            pumpOnInterval == other.pumpOnInterval &&
            pumpOffInterval == other.pumpOffInterval &&
            ledOnStartTime == other.ledOnStartTime &&
            ledOnEndTime == other.ledOnEndTime &&
            ledOffStartTime == other.ledOffStartTime &&
            ledOffEndTime == other.ledOffEndTime &&
            secretNumber == other.secretNumber;
  }

  @override
  int get hashCode {
    return deviceCode.hashCode ^
        macAddress.hashCode ^
        modeName.hashCode ^
        ledMode.hashCode ^
        pumpOnInterval.hashCode ^
        pumpOffInterval.hashCode ^
        ledOnStartTime.hashCode ^
        ledOnEndTime.hashCode ^
        ledOffStartTime.hashCode ^
        ledOffEndTime.hashCode ^
        secretNumber.hashCode;
  }
}
