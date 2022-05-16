// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'composed_yarn_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComposedYarnState {
  bool get isAdding => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComposedYarnStateCopyWith<ComposedYarnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposedYarnStateCopyWith<$Res> {
  factory $ComposedYarnStateCopyWith(
          ComposedYarnState value, $Res Function(ComposedYarnState) then) =
      _$ComposedYarnStateCopyWithImpl<$Res>;
  $Res call({bool isAdding});
}

/// @nodoc
class _$ComposedYarnStateCopyWithImpl<$Res>
    implements $ComposedYarnStateCopyWith<$Res> {
  _$ComposedYarnStateCopyWithImpl(this._value, this._then);

  final ComposedYarnState _value;
  // ignore: unused_field
  final $Res Function(ComposedYarnState) _then;

  @override
  $Res call({
    Object? isAdding = freezed,
  }) {
    return _then(_value.copyWith(
      isAdding: isAdding == freezed
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ComposedYarnStateCopyWith<$Res>
    implements $ComposedYarnStateCopyWith<$Res> {
  factory _$$_ComposedYarnStateCopyWith(_$_ComposedYarnState value,
          $Res Function(_$_ComposedYarnState) then) =
      __$$_ComposedYarnStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isAdding});
}

/// @nodoc
class __$$_ComposedYarnStateCopyWithImpl<$Res>
    extends _$ComposedYarnStateCopyWithImpl<$Res>
    implements _$$_ComposedYarnStateCopyWith<$Res> {
  __$$_ComposedYarnStateCopyWithImpl(
      _$_ComposedYarnState _value, $Res Function(_$_ComposedYarnState) _then)
      : super(_value, (v) => _then(v as _$_ComposedYarnState));

  @override
  _$_ComposedYarnState get _value => super._value as _$_ComposedYarnState;

  @override
  $Res call({
    Object? isAdding = freezed,
  }) {
    return _then(_$_ComposedYarnState(
      isAdding: isAdding == freezed
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ComposedYarnState implements _ComposedYarnState {
  const _$_ComposedYarnState({required this.isAdding});

  @override
  final bool isAdding;

  @override
  String toString() {
    return 'ComposedYarnState(isAdding: $isAdding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComposedYarnState &&
            const DeepCollectionEquality().equals(other.isAdding, isAdding));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isAdding));

  @JsonKey(ignore: true)
  @override
  _$$_ComposedYarnStateCopyWith<_$_ComposedYarnState> get copyWith =>
      __$$_ComposedYarnStateCopyWithImpl<_$_ComposedYarnState>(
          this, _$identity);
}

abstract class _ComposedYarnState implements ComposedYarnState {
  const factory _ComposedYarnState({required final bool isAdding}) =
      _$_ComposedYarnState;

  @override
  bool get isAdding => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ComposedYarnStateCopyWith<_$_ComposedYarnState> get copyWith =>
      throw _privateConstructorUsedError;
}
