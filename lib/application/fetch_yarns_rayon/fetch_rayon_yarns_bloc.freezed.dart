// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_rayon_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchRayonYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchRayonYarnsStateCopyWith<FetchRayonYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchRayonYarnsStateCopyWith<$Res> {
  factory $FetchRayonYarnsStateCopyWith(FetchRayonYarnsState value,
          $Res Function(FetchRayonYarnsState) then) =
      _$FetchRayonYarnsStateCopyWithImpl<$Res>;
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class _$FetchRayonYarnsStateCopyWithImpl<$Res>
    implements $FetchRayonYarnsStateCopyWith<$Res> {
  _$FetchRayonYarnsStateCopyWithImpl(this._value, this._then);

  final FetchRayonYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchRayonYarnsState) _then;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      yarns: yarns == freezed
          ? _value.yarns
          : yarns // ignore: cast_nullable_to_non_nullable
              as List<Yarn>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc
abstract class _$FetchRayonYarnsStateCopyWith<$Res>
    implements $FetchRayonYarnsStateCopyWith<$Res> {
  factory _$FetchRayonYarnsStateCopyWith(_FetchRayonYarnsState value,
          $Res Function(_FetchRayonYarnsState) then) =
      __$FetchRayonYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class __$FetchRayonYarnsStateCopyWithImpl<$Res>
    extends _$FetchRayonYarnsStateCopyWithImpl<$Res>
    implements _$FetchRayonYarnsStateCopyWith<$Res> {
  __$FetchRayonYarnsStateCopyWithImpl(
      _FetchRayonYarnsState _value, $Res Function(_FetchRayonYarnsState) _then)
      : super(_value, (v) => _then(v as _FetchRayonYarnsState));

  @override
  _FetchRayonYarnsState get _value => super._value as _FetchRayonYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_FetchRayonYarnsState(
      yarns: yarns == freezed
          ? _value.yarns
          : yarns // ignore: cast_nullable_to_non_nullable
              as List<Yarn>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$_FetchRayonYarnsState implements _FetchRayonYarnsState {
  const _$_FetchRayonYarnsState(
      {required final List<Yarn> yarns,
      required this.isLoading,
      required this.error})
      : _yarns = yarns;

  final List<Yarn> _yarns;
  @override
  List<Yarn> get yarns {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yarns);
  }

  @override
  final bool isLoading;
  @override
  final Option<Failure> error;

  @override
  String toString() {
    return 'FetchRayonYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchRayonYarnsState &&
            const DeepCollectionEquality().equals(other.yarns, yarns) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(yarns),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$FetchRayonYarnsStateCopyWith<_FetchRayonYarnsState> get copyWith =>
      __$FetchRayonYarnsStateCopyWithImpl<_FetchRayonYarnsState>(
          this, _$identity);
}

abstract class _FetchRayonYarnsState implements FetchRayonYarnsState {
  const factory _FetchRayonYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error}) = _$_FetchRayonYarnsState;

  @override
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FetchRayonYarnsStateCopyWith<_FetchRayonYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
