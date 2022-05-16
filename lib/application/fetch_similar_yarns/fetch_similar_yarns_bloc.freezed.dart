// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_similar_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchSimilarYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;
  int get expandedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchSimilarYarnsStateCopyWith<FetchSimilarYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchSimilarYarnsStateCopyWith<$Res> {
  factory $FetchSimilarYarnsStateCopyWith(FetchSimilarYarnsState value,
          $Res Function(FetchSimilarYarnsState) then) =
      _$FetchSimilarYarnsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class _$FetchSimilarYarnsStateCopyWithImpl<$Res>
    implements $FetchSimilarYarnsStateCopyWith<$Res> {
  _$FetchSimilarYarnsStateCopyWithImpl(this._value, this._then);

  final FetchSimilarYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchSimilarYarnsState) _then;

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
abstract class _$$_FetchSimilarYarnsStateCopyWith<$Res>
    implements $FetchSimilarYarnsStateCopyWith<$Res> {
  factory _$$_FetchSimilarYarnsStateCopyWith(_$_FetchSimilarYarnsState value,
          $Res Function(_$_FetchSimilarYarnsState) then) =
      __$$_FetchSimilarYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class __$$_FetchSimilarYarnsStateCopyWithImpl<$Res>
    extends _$FetchSimilarYarnsStateCopyWithImpl<$Res>
    implements _$$_FetchSimilarYarnsStateCopyWith<$Res> {
  __$$_FetchSimilarYarnsStateCopyWithImpl(_$_FetchSimilarYarnsState _value,
      $Res Function(_$_FetchSimilarYarnsState) _then)
      : super(_value, (v) => _then(v as _$_FetchSimilarYarnsState));

  @override
  _$_FetchSimilarYarnsState get _value =>
      super._value as _$_FetchSimilarYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_$_FetchSimilarYarnsState(
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

class _$_FetchSimilarYarnsState implements _FetchSimilarYarnsState {
  const _$_FetchSimilarYarnsState(
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
    return 'FetchSimilarYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchSimilarYarnsState &&
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
  _$$_FetchSimilarYarnsStateCopyWith<_$_FetchSimilarYarnsState> get copyWith =>
      __$$_FetchSimilarYarnsStateCopyWithImpl<_$_FetchSimilarYarnsState>(
          this, _$identity);
}

abstract class _FetchSimilarYarnsState implements FetchSimilarYarnsState {
  const factory _FetchSimilarYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error,
      required final int expandedIndex}) = _$_FetchSimilarYarnsState;

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
  _$$_FetchSimilarYarnsStateCopyWith<_$_FetchSimilarYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
