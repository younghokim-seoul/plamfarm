// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectorState {
  DiscoveredDevice get discoveredDevices => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectorStateCopyWith<ConnectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectorStateCopyWith<$Res> {
  factory $ConnectorStateCopyWith(
          ConnectorState value, $Res Function(ConnectorState) then) =
      _$ConnectorStateCopyWithImpl<$Res, ConnectorState>;
  @useResult
  $Res call({DiscoveredDevice discoveredDevices, String deviceName});
}

/// @nodoc
class _$ConnectorStateCopyWithImpl<$Res, $Val extends ConnectorState>
    implements $ConnectorStateCopyWith<$Res> {
  _$ConnectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveredDevices = null,
    Object? deviceName = null,
  }) {
    return _then(_value.copyWith(
      discoveredDevices: null == discoveredDevices
          ? _value.discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectorStateImplCopyWith<$Res>
    implements $ConnectorStateCopyWith<$Res> {
  factory _$$ConnectorStateImplCopyWith(_$ConnectorStateImpl value,
          $Res Function(_$ConnectorStateImpl) then) =
      __$$ConnectorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiscoveredDevice discoveredDevices, String deviceName});
}

/// @nodoc
class __$$ConnectorStateImplCopyWithImpl<$Res>
    extends _$ConnectorStateCopyWithImpl<$Res, _$ConnectorStateImpl>
    implements _$$ConnectorStateImplCopyWith<$Res> {
  __$$ConnectorStateImplCopyWithImpl(
      _$ConnectorStateImpl _value, $Res Function(_$ConnectorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveredDevices = null,
    Object? deviceName = null,
  }) {
    return _then(_$ConnectorStateImpl(
      discoveredDevices: null == discoveredDevices
          ? _value.discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectorStateImpl implements _ConnectorState {
  _$ConnectorStateImpl(
      {required this.discoveredDevices, required this.deviceName});

  @override
  final DiscoveredDevice discoveredDevices;
  @override
  final String deviceName;

  @override
  String toString() {
    return 'ConnectorState(discoveredDevices: $discoveredDevices, deviceName: $deviceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectorStateImpl &&
            (identical(other.discoveredDevices, discoveredDevices) ||
                other.discoveredDevices == discoveredDevices) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discoveredDevices, deviceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectorStateImplCopyWith<_$ConnectorStateImpl> get copyWith =>
      __$$ConnectorStateImplCopyWithImpl<_$ConnectorStateImpl>(
          this, _$identity);
}

abstract class _ConnectorState implements ConnectorState {
  factory _ConnectorState(
      {required final DiscoveredDevice discoveredDevices,
      required final String deviceName}) = _$ConnectorStateImpl;

  @override
  DiscoveredDevice get discoveredDevices;
  @override
  String get deviceName;
  @override
  @JsonKey(ignore: true)
  _$$ConnectorStateImplCopyWith<_$ConnectorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
