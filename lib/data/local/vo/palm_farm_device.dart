import 'package:floor/floor.dart';

@entity
class PalmFarmDevice {
  @primaryKey
  final String macAddress;
  final String reName;
  final String originName;
  final String vegetableLedTime;
  final String strawBerryLedTime;
  final String flowersLedTime;
  final DateTime createdAt;

  PalmFarmDevice(
    this.macAddress,
    this.reName,
    this.originName,
    this.vegetableLedTime,
    this.strawBerryLedTime,
    this.flowersLedTime,
    this.createdAt,
  );

  factory PalmFarmDevice.create({
    required String macAddress,
    required String reName,
    required String originName,
    String? vegetableLedTime,
    String? strawBerryLedTime,
    String? flowersLedTime,
    DateTime? createdAt,
  }) =>
      PalmFarmDevice(
        macAddress,
        reName,
        originName,
        vegetableLedTime ?? "",
        strawBerryLedTime ?? "",
        flowersLedTime ?? "",
        createdAt ?? DateTime.now(),
      );

  PalmFarmDevice copyWith({
    String? macAddress,
    String? reName,
    String? originName,
    String? vegetableLedTime,
    String? strawBerryLedTime,
    String? flowersLedTime,
    DateTime? createdAt,
  }) {
    return PalmFarmDevice(
      macAddress ?? this.macAddress,
      reName ?? this.reName,
      originName ?? this.originName,
      vegetableLedTime ?? this.vegetableLedTime,
      strawBerryLedTime ?? this.strawBerryLedTime,
      flowersLedTime ?? this.flowersLedTime,
      createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'PalmFarmDevice{id: $macAddress, reName: $reName, originName: $originName,DateTime: $DateTime ,vegetableLedTime: $vegetableLedTime ,strawBerryLedTime: $strawBerryLedTime ,flowersLedTime: $flowersLedTime}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PalmFarmDevice &&
            runtimeType == other.runtimeType &&
            macAddress == other.macAddress &&
            reName == other.reName &&
            originName == other.originName &&
            vegetableLedTime == other.vegetableLedTime &&
            strawBerryLedTime == other.strawBerryLedTime &&
            flowersLedTime == other.flowersLedTime &&
            createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return macAddress.hashCode ^
        reName.hashCode ^
        originName.hashCode ^
        vegetableLedTime.hashCode ^
        strawBerryLedTime.hashCode ^
        flowersLedTime.hashCode ^
        createdAt.hashCode;
  }
}
