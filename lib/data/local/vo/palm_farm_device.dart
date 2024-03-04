import 'package:floor/floor.dart';

@entity
class PalmFarmDevice {
  @primaryKey
  final String macAddress;
  final String name;
  final DateTime createdAt;

  PalmFarmDevice(this.macAddress, this.name, this.createdAt);

  factory PalmFarmDevice.create({
    required String macAddress,
    required String name,
    DateTime? createdAt,
  }) =>
      PalmFarmDevice(
        macAddress,
        name,
        createdAt ?? DateTime.now(),
      );

  PalmFarmDevice copyWith({
    String? macAddress,
    String? name,
    DateTime? createdAt,
  }) {
    return PalmFarmDevice(
      macAddress ?? this.macAddress,
      name ?? this.name,
      createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'PalmFarmDevice{id: $macAddress, name: $name, DateTime: $DateTime}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PalmFarmDevice &&
            runtimeType == other.runtimeType &&
            macAddress == other.macAddress &&
            name == other.name &&
            createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return macAddress.hashCode ^ name.hashCode ^ createdAt.hashCode;
  }
}
