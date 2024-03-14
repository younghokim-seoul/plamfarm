// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'led_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LedSettingState {
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LedSettingStateCopyWith<LedSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedSettingStateCopyWith<$Res> {
  factory $LedSettingStateCopyWith(
          LedSettingState value, $Res Function(LedSettingState) then) =
      _$LedSettingStateCopyWithImpl<$Res, LedSettingState>;
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class _$LedSettingStateCopyWithImpl<$Res, $Val extends LedSettingState>
    implements $LedSettingStateCopyWith<$Res> {
  _$LedSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedSettingStateImplCopyWith<$Res>
    implements $LedSettingStateCopyWith<$Res> {
  factory _$$LedSettingStateImplCopyWith(_$LedSettingStateImpl value,
          $Res Function(_$LedSettingStateImpl) then) =
      __$$LedSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class __$$LedSettingStateImplCopyWithImpl<$Res>
    extends _$LedSettingStateCopyWithImpl<$Res, _$LedSettingStateImpl>
    implements _$$LedSettingStateImplCopyWith<$Res> {
  __$$LedSettingStateImplCopyWithImpl(
      _$LedSettingStateImpl _value, $Res Function(_$LedSettingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$LedSettingStateImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LedSettingStateImpl implements _LedSettingState {
  _$LedSettingStateImpl({required this.startTime, required this.endTime});

  @override
  final String startTime;
  @override
  final String endTime;

  @override
  String toString() {
    return 'LedSettingState(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedSettingStateImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LedSettingStateImplCopyWith<_$LedSettingStateImpl> get copyWith =>
      __$$LedSettingStateImplCopyWithImpl<_$LedSettingStateImpl>(
          this, _$identity);
}

abstract class _LedSettingState implements LedSettingState {
  factory _LedSettingState(
      {required final String startTime,
      required final String endTime}) = _$LedSettingStateImpl;

  @override
  String get startTime;
  @override
  String get endTime;
  @override
  @JsonKey(ignore: true)
  _$$LedSettingStateImplCopyWith<_$LedSettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
