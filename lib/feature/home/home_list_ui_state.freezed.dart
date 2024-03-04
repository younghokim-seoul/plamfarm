// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_list_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeListUiState {
  List<PalmFarmDevice> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeListUiStateCopyWith<HomeListUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeListUiStateCopyWith<$Res> {
  factory $HomeListUiStateCopyWith(
          HomeListUiState value, $Res Function(HomeListUiState) then) =
      _$HomeListUiStateCopyWithImpl<$Res, HomeListUiState>;
  @useResult
  $Res call({List<PalmFarmDevice> items});
}

/// @nodoc
class _$HomeListUiStateCopyWithImpl<$Res, $Val extends HomeListUiState>
    implements $HomeListUiStateCopyWith<$Res> {
  _$HomeListUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PalmFarmDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeListUiStateImplCopyWith<$Res>
    implements $HomeListUiStateCopyWith<$Res> {
  factory _$$HomeListUiStateImplCopyWith(_$HomeListUiStateImpl value,
          $Res Function(_$HomeListUiStateImpl) then) =
      __$$HomeListUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PalmFarmDevice> items});
}

/// @nodoc
class __$$HomeListUiStateImplCopyWithImpl<$Res>
    extends _$HomeListUiStateCopyWithImpl<$Res, _$HomeListUiStateImpl>
    implements _$$HomeListUiStateImplCopyWith<$Res> {
  __$$HomeListUiStateImplCopyWithImpl(
      _$HomeListUiStateImpl _value, $Res Function(_$HomeListUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$HomeListUiStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PalmFarmDevice>,
    ));
  }
}

/// @nodoc

class _$HomeListUiStateImpl implements _HomeListUiState {
  _$HomeListUiStateImpl({required final List<PalmFarmDevice> items})
      : _items = items;

  final List<PalmFarmDevice> _items;
  @override
  List<PalmFarmDevice> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'HomeListUiState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeListUiStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeListUiStateImplCopyWith<_$HomeListUiStateImpl> get copyWith =>
      __$$HomeListUiStateImplCopyWithImpl<_$HomeListUiStateImpl>(
          this, _$identity);
}

abstract class _HomeListUiState implements HomeListUiState {
  factory _HomeListUiState({required final List<PalmFarmDevice> items}) =
      _$HomeListUiStateImpl;

  @override
  List<PalmFarmDevice> get items;
  @override
  @JsonKey(ignore: true)
  _$$HomeListUiStateImplCopyWith<_$HomeListUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
