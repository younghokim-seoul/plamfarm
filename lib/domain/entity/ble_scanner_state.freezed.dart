// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BleScannerState {
  List<DiscoveredDevice> get discoveredDevices =>
      throw _privateConstructorUsedError;
  bool get scanIsInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BleScannerStateCopyWith<BleScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BleScannerStateCopyWith<$Res> {
  factory $BleScannerStateCopyWith(
          BleScannerState value, $Res Function(BleScannerState) then) =
      _$BleScannerStateCopyWithImpl<$Res, BleScannerState>;
  @useResult
  $Res call({List<DiscoveredDevice> discoveredDevices, bool scanIsInProgress});
}

/// @nodoc
class _$BleScannerStateCopyWithImpl<$Res, $Val extends BleScannerState>
    implements $BleScannerStateCopyWith<$Res> {
  _$BleScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveredDevices = null,
    Object? scanIsInProgress = null,
  }) {
    return _then(_value.copyWith(
      discoveredDevices: null == discoveredDevices
          ? _value.discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      scanIsInProgress: null == scanIsInProgress
          ? _value.scanIsInProgress
          : scanIsInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BleScannerStateImplCopyWith<$Res>
    implements $BleScannerStateCopyWith<$Res> {
  factory _$$BleScannerStateImplCopyWith(_$BleScannerStateImpl value,
          $Res Function(_$BleScannerStateImpl) then) =
      __$$BleScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DiscoveredDevice> discoveredDevices, bool scanIsInProgress});
}

/// @nodoc
class __$$BleScannerStateImplCopyWithImpl<$Res>
    extends _$BleScannerStateCopyWithImpl<$Res, _$BleScannerStateImpl>
    implements _$$BleScannerStateImplCopyWith<$Res> {
  __$$BleScannerStateImplCopyWithImpl(
      _$BleScannerStateImpl _value, $Res Function(_$BleScannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveredDevices = null,
    Object? scanIsInProgress = null,
  }) {
    return _then(_$BleScannerStateImpl(
      discoveredDevices: null == discoveredDevices
          ? _value._discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      scanIsInProgress: null == scanIsInProgress
          ? _value.scanIsInProgress
          : scanIsInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BleScannerStateImpl implements _BleScannerState {
  _$BleScannerStateImpl(
      {required final List<DiscoveredDevice> discoveredDevices,
      required this.scanIsInProgress})
      : _discoveredDevices = discoveredDevices;

  final List<DiscoveredDevice> _discoveredDevices;
  @override
  List<DiscoveredDevice> get discoveredDevices {
    if (_discoveredDevices is EqualUnmodifiableListView)
      return _discoveredDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discoveredDevices);
  }

  @override
  final bool scanIsInProgress;

  @override
  String toString() {
    return 'BleScannerState(discoveredDevices: $discoveredDevices, scanIsInProgress: $scanIsInProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BleScannerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._discoveredDevices, _discoveredDevices) &&
            (identical(other.scanIsInProgress, scanIsInProgress) ||
                other.scanIsInProgress == scanIsInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_discoveredDevices),
      scanIsInProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleScannerStateImplCopyWith<_$BleScannerStateImpl> get copyWith =>
      __$$BleScannerStateImplCopyWithImpl<_$BleScannerStateImpl>(
          this, _$identity);
}

abstract class _BleScannerState implements BleScannerState {
  factory _BleScannerState(
      {required final List<DiscoveredDevice> discoveredDevices,
      required final bool scanIsInProgress}) = _$BleScannerStateImpl;

  @override
  List<DiscoveredDevice> get discoveredDevices;
  @override
  bool get scanIsInProgress;
  @override
  @JsonKey(ignore: true)
  _$$BleScannerStateImplCopyWith<_$BleScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
