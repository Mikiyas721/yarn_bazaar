// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_worsted_wool_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchWorstedWoolYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;
  int get expandedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchWorstedWoolYarnsStateCopyWith<FetchWorstedWoolYarnsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchWorstedWoolYarnsStateCopyWith<$Res> {
  factory $FetchWorstedWoolYarnsStateCopyWith(FetchWorstedWoolYarnsState value,
          $Res Function(FetchWorstedWoolYarnsState) then) =
      _$FetchWorstedWoolYarnsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class _$FetchWorstedWoolYarnsStateCopyWithImpl<$Res>
    implements $FetchWorstedWoolYarnsStateCopyWith<$Res> {
  _$FetchWorstedWoolYarnsStateCopyWithImpl(this._value, this._then);

  final FetchWorstedWoolYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchWorstedWoolYarnsState) _then;

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
abstract class _$$_FetchWorstedWoolYarnsStateCopyWith<$Res>
    implements $FetchWorstedWoolYarnsStateCopyWith<$Res> {
  factory _$$_FetchWorstedWoolYarnsStateCopyWith(
          _$_FetchWorstedWoolYarnsState value,
          $Res Function(_$_FetchWorstedWoolYarnsState) then) =
      __$$_FetchWorstedWoolYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class __$$_FetchWorstedWoolYarnsStateCopyWithImpl<$Res>
    extends _$FetchWorstedWoolYarnsStateCopyWithImpl<$Res>
    implements _$$_FetchWorstedWoolYarnsStateCopyWith<$Res> {
  __$$_FetchWorstedWoolYarnsStateCopyWithImpl(
      _$_FetchWorstedWoolYarnsState _value,
      $Res Function(_$_FetchWorstedWoolYarnsState) _then)
      : super(_value, (v) => _then(v as _$_FetchWorstedWoolYarnsState));

  @override
  _$_FetchWorstedWoolYarnsState get _value =>
      super._value as _$_FetchWorstedWoolYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_$_FetchWorstedWoolYarnsState(
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

class _$_FetchWorstedWoolYarnsState implements _FetchWorstedWoolYarnsState {
  const _$_FetchWorstedWoolYarnsState(
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
    return 'FetchWorstedWoolYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchWorstedWoolYarnsState &&
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
  _$$_FetchWorstedWoolYarnsStateCopyWith<_$_FetchWorstedWoolYarnsState>
      get copyWith => __$$_FetchWorstedWoolYarnsStateCopyWithImpl<
          _$_FetchWorstedWoolYarnsState>(this, _$identity);
}

abstract class _FetchWorstedWoolYarnsState
    implements FetchWorstedWoolYarnsState {
  const factory _FetchWorstedWoolYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error,
      required final int expandedIndex}) = _$_FetchWorstedWoolYarnsState;

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
  _$$_FetchWorstedWoolYarnsStateCopyWith<_$_FetchWorstedWoolYarnsState>
      get copyWith => throw _privateConstructorUsedError;
}
