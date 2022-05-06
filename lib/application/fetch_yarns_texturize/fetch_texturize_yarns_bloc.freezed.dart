// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_texturize_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchTexturizeYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchTexturizeYarnsStateCopyWith<FetchTexturizeYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchTexturizeYarnsStateCopyWith<$Res> {
  factory $FetchTexturizeYarnsStateCopyWith(FetchTexturizeYarnsState value,
          $Res Function(FetchTexturizeYarnsState) then) =
      _$FetchTexturizeYarnsStateCopyWithImpl<$Res>;
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class _$FetchTexturizeYarnsStateCopyWithImpl<$Res>
    implements $FetchTexturizeYarnsStateCopyWith<$Res> {
  _$FetchTexturizeYarnsStateCopyWithImpl(this._value, this._then);

  final FetchTexturizeYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchTexturizeYarnsState) _then;

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
abstract class _$FetchTexturizeYarnsStateCopyWith<$Res>
    implements $FetchTexturizeYarnsStateCopyWith<$Res> {
  factory _$FetchTexturizeYarnsStateCopyWith(_FetchTexturizeYarnsState value,
          $Res Function(_FetchTexturizeYarnsState) then) =
      __$FetchTexturizeYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Yarn> yarns, bool isLoading, Option<Failure> error});
}

/// @nodoc
class __$FetchTexturizeYarnsStateCopyWithImpl<$Res>
    extends _$FetchTexturizeYarnsStateCopyWithImpl<$Res>
    implements _$FetchTexturizeYarnsStateCopyWith<$Res> {
  __$FetchTexturizeYarnsStateCopyWithImpl(_FetchTexturizeYarnsState _value,
      $Res Function(_FetchTexturizeYarnsState) _then)
      : super(_value, (v) => _then(v as _FetchTexturizeYarnsState));

  @override
  _FetchTexturizeYarnsState get _value =>
      super._value as _FetchTexturizeYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_FetchTexturizeYarnsState(
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

class _$_FetchTexturizeYarnsState implements _FetchTexturizeYarnsState {
  const _$_FetchTexturizeYarnsState(
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
    return 'FetchTexturizeYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchTexturizeYarnsState &&
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
  _$FetchTexturizeYarnsStateCopyWith<_FetchTexturizeYarnsState> get copyWith =>
      __$FetchTexturizeYarnsStateCopyWithImpl<_FetchTexturizeYarnsState>(
          this, _$identity);
}

abstract class _FetchTexturizeYarnsState implements FetchTexturizeYarnsState {
  const factory _FetchTexturizeYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error}) = _$_FetchTexturizeYarnsState;

  @override
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FetchTexturizeYarnsStateCopyWith<_FetchTexturizeYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
