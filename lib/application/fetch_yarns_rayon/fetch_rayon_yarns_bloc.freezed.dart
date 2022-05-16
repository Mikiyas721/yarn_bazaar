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
  int get expandedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchRayonYarnsStateCopyWith<FetchRayonYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchRayonYarnsStateCopyWith<$Res> {
  factory $FetchRayonYarnsStateCopyWith(FetchRayonYarnsState value,
          $Res Function(FetchRayonYarnsState) then) =
      _$FetchRayonYarnsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
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
    Object? expandedIndex = freezed,
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
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FetchRayonYarnsStateCopyWith<$Res>
    implements $FetchRayonYarnsStateCopyWith<$Res> {
  factory _$$_FetchRayonYarnsStateCopyWith(_$_FetchRayonYarnsState value,
          $Res Function(_$_FetchRayonYarnsState) then) =
      __$$_FetchRayonYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class __$$_FetchRayonYarnsStateCopyWithImpl<$Res>
    extends _$FetchRayonYarnsStateCopyWithImpl<$Res>
    implements _$$_FetchRayonYarnsStateCopyWith<$Res> {
  __$$_FetchRayonYarnsStateCopyWithImpl(_$_FetchRayonYarnsState _value,
      $Res Function(_$_FetchRayonYarnsState) _then)
      : super(_value, (v) => _then(v as _$_FetchRayonYarnsState));

  @override
  _$_FetchRayonYarnsState get _value => super._value as _$_FetchRayonYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_$_FetchRayonYarnsState(
      yarns: yarns == freezed
          ? _value._yarns
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
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchRayonYarnsState implements _FetchRayonYarnsState {
  const _$_FetchRayonYarnsState(
      {required final List<Yarn> yarns,
      required this.isLoading,
      required this.error,
      required this.expandedIndex})
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
  final int expandedIndex;

  @override
  String toString() {
    return 'FetchRayonYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchRayonYarnsState &&
            const DeepCollectionEquality().equals(other._yarns, _yarns) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.expandedIndex, expandedIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_yarns),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(expandedIndex));

  @JsonKey(ignore: true)
  @override
  _$$_FetchRayonYarnsStateCopyWith<_$_FetchRayonYarnsState> get copyWith =>
      __$$_FetchRayonYarnsStateCopyWithImpl<_$_FetchRayonYarnsState>(
          this, _$identity);
}

abstract class _FetchRayonYarnsState implements FetchRayonYarnsState {
  const factory _FetchRayonYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error,
      required final int expandedIndex}) = _$_FetchRayonYarnsState;

  @override
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  int get expandedIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FetchRayonYarnsStateCopyWith<_$_FetchRayonYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
