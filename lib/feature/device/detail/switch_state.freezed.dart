// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwitchState {
  bool get enableLed => throw _privateConstructorUsedError;
  bool get enablePump => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwitchStateCopyWith<SwitchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchStateCopyWith<$Res> {
  factory $SwitchStateCopyWith(
          SwitchState value, $Res Function(SwitchState) then) =
      _$SwitchStateCopyWithImpl<$Res, SwitchState>;
  @useResult
  $Res call({bool enableLed, bool enablePump});
}

/// @nodoc
class _$SwitchStateCopyWithImpl<$Res, $Val extends SwitchState>
    implements $SwitchStateCopyWith<$Res> {
  _$SwitchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableLed = null,
    Object? enablePump = null,
  }) {
    return _then(_value.copyWith(
      enableLed: null == enableLed
          ? _value.enableLed
          : enableLed // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePump: null == enablePump
          ? _value.enablePump
          : enablePump // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchStateImplCopyWith<$Res>
    implements $SwitchStateCopyWith<$Res> {
  factory _$$SwitchStateImplCopyWith(
          _$SwitchStateImpl value, $Res Function(_$SwitchStateImpl) then) =
      __$$SwitchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enableLed, bool enablePump});
}

/// @nodoc
class __$$SwitchStateImplCopyWithImpl<$Res>
    extends _$SwitchStateCopyWithImpl<$Res, _$SwitchStateImpl>
    implements _$$SwitchStateImplCopyWith<$Res> {
  __$$SwitchStateImplCopyWithImpl(
      _$SwitchStateImpl _value, $Res Function(_$SwitchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableLed = null,
    Object? enablePump = null,
  }) {
    return _then(_$SwitchStateImpl(
      enableLed: null == enableLed
          ? _value.enableLed
          : enableLed // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePump: null == enablePump
          ? _value.enablePump
          : enablePump // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SwitchStateImpl implements _SwitchState {
  _$SwitchStateImpl({required this.enableLed, required this.enablePump});

  @override
  final bool enableLed;
  @override
  final bool enablePump;

  @override
  String toString() {
    return 'SwitchState(enableLed: $enableLed, enablePump: $enablePump)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchStateImpl &&
            (identical(other.enableLed, enableLed) ||
                other.enableLed == enableLed) &&
            (identical(other.enablePump, enablePump) ||
                other.enablePump == enablePump));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enableLed, enablePump);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      __$$SwitchStateImplCopyWithImpl<_$SwitchStateImpl>(this, _$identity);
}

abstract class _SwitchState implements SwitchState {
  factory _SwitchState(
      {required final bool enableLed,
      required final bool enablePump}) = _$SwitchStateImpl;

  @override
  bool get enableLed;
  @override
  bool get enablePump;
  @override
  @JsonKey(ignore: true)
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
