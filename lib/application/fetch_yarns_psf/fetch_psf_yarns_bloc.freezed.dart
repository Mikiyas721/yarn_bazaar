// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_psf_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchPsfYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchPsfYarnsStateCopyWith<FetchPsfYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPsfYarnsStateCopyWith<$Res> {
  factory $FetchPsfYarnsStateCopyWith(
          FetchPsfYarnsState value, $Res Function(FetchPsfYarnsState) then) =
      _$FetchPsfYarnsStateCopyWithImpl<$Res>;
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class _$FetchPsfYarnsStateCopyWithImpl<$Res>
    implements $FetchPsfYarnsStateCopyWith<$Res> {
  _$FetchPsfYarnsStateCopyWithImpl(this._value, this._then);

  final FetchPsfYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchPsfYarnsState) _then;

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
abstract class _$FetchPsfYarnsStateCopyWith<$Res>
    implements $FetchPsfYarnsStateCopyWith<$Res> {
  factory _$FetchPsfYarnsStateCopyWith(
          _FetchPsfYarnsState value, $Res Function(_FetchPsfYarnsState) then) =
      __$FetchPsfYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class __$FetchPsfYarnsStateCopyWithImpl<$Res>
    extends _$FetchPsfYarnsStateCopyWithImpl<$Res>
    implements _$FetchPsfYarnsStateCopyWith<$Res> {
  __$FetchPsfYarnsStateCopyWithImpl(
      _FetchPsfYarnsState _value, $Res Function(_FetchPsfYarnsState) _then)
      : super(_value, (v) => _then(v as _FetchPsfYarnsState));

  @override
  _FetchPsfYarnsState get _value => super._value as _FetchPsfYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_FetchPsfYarnsState(
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

class _$_FetchPsfYarnsState implements _FetchPsfYarnsState {
  const _$_FetchPsfYarnsState(
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
    return 'FetchPsfYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchPsfYarnsState &&
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
  _$FetchPsfYarnsStateCopyWith<_FetchPsfYarnsState> get copyWith =>
      __$FetchPsfYarnsStateCopyWithImpl<_FetchPsfYarnsState>(this, _$identity);
}

abstract class _FetchPsfYarnsState implements FetchPsfYarnsState {
  const factory _FetchPsfYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error}) = _$_FetchPsfYarnsState;

  @override
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FetchPsfYarnsStateCopyWith<_FetchPsfYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
