import 'package:floor/floor.dart';

@entity
class PalmFarmDevice {
  @primaryKey
  final String macAddress;
  final String reName;
  final String originName;
  final DateTime createdAt;

  PalmFarmDevice(this.macAddress, this.reName, this.originName, this.createdAt);

  factory PalmFarmDevice.create({
    required String macAddress,
    required String reName,
    required String originName,
    DateTime? createdAt,
  }) =>
      PalmFarmDevice(
        macAddress,
        reName,
        originName,
        createdAt ?? DateTime.now(),
      );

  PalmFarmDevice copyWith({
    String? macAddress,
    String? reName,
    String? originName,
    DateTime? createdAt,
  }) {
    return PalmFarmDevice(
      macAddress ?? this.macAddress,
      reName ?? this.reName,
      originName ?? this.originName,
      createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'PalmFarmDevice{id: $macAddress, reName: $reName, originName: $originName,DateTime: $DateTime}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PalmFarmDevice &&
            runtimeType == other.runtimeType &&
            macAddress == other.macAddress &&
            reName == other.reName &&
            originName == other.originName &&
            createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return macAddress.hashCode ^
        reName.hashCode ^
        originName.hashCode ^
        createdAt.hashCode;
  }
}
