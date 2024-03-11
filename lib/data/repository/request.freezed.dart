// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Request {
  String get command => throw _privateConstructorUsedError;
  LoggerCallback? get onError => throw _privateConstructorUsedError;
  LoggerCallback? get onResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res, Request>;
  @useResult
  $Res call(
      {String command, LoggerCallback? onError, LoggerCallback? onResponse});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res, $Val extends Request>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? onError = freezed,
    Object? onResponse = freezed,
  }) {
    return _then(_value.copyWith(
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as LoggerCallback?,
      onResponse: freezed == onResponse
          ? _value.onResponse
          : onResponse // ignore: cast_nullable_to_non_nullable
              as LoggerCallback?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestImplCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$$RequestImplCopyWith(
          _$RequestImpl value, $Res Function(_$RequestImpl) then) =
      __$$RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String command, LoggerCallback? onError, LoggerCallback? onResponse});
}

/// @nodoc
class __$$RequestImplCopyWithImpl<$Res>
    extends _$RequestCopyWithImpl<$Res, _$RequestImpl>
    implements _$$RequestImplCopyWith<$Res> {
  __$$RequestImplCopyWithImpl(
      _$RequestImpl _value, $Res Function(_$RequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? onError = freezed,
    Object? onResponse = freezed,
  }) {
    return _then(_$RequestImpl(
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as LoggerCallback?,
      onResponse: freezed == onResponse
          ? _value.onResponse
          : onResponse // ignore: cast_nullable_to_non_nullable
              as LoggerCallback?,
    ));
  }
}

/// @nodoc

class _$RequestImpl implements _Request {
  _$RequestImpl({required this.command, this.onError, this.onResponse});

  @override
  final String command;
  @override
  final LoggerCallback? onError;
  @override
  final LoggerCallback? onResponse;

  @override
  String toString() {
    return 'Request(command: $command, onError: $onError, onResponse: $onResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestImpl &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.onResponse, onResponse) ||
                other.onResponse == onResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, command, onError, onResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      __$$RequestImplCopyWithImpl<_$RequestImpl>(this, _$identity);
}

abstract class _Request implements Request {
  factory _Request(
      {required final String command,
      final LoggerCallback? onError,
      final LoggerCallback? onResponse}) = _$RequestImpl;

  @override
  String get command;
  @override
  LoggerCallback? get onError;
  @override
  LoggerCallback? get onResponse;
  @override
  @JsonKey(ignore: true)
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
