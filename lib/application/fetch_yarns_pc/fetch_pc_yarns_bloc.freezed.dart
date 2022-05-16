// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_pc_yarns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchPcYarnsState {
  List<Yarn> get yarns => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;
  int get expandedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchPcYarnsStateCopyWith<FetchPcYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPcYarnsStateCopyWith<$Res> {
  factory $FetchPcYarnsStateCopyWith(
          FetchPcYarnsState value, $Res Function(FetchPcYarnsState) then) =
      _$FetchPcYarnsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class _$FetchPcYarnsStateCopyWithImpl<$Res>
    implements $FetchPcYarnsStateCopyWith<$Res> {
  _$FetchPcYarnsStateCopyWithImpl(this._value, this._then);

  final FetchPcYarnsState _value;
  // ignore: unused_field
  final $Res Function(FetchPcYarnsState) _then;

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
abstract class _$$_FetchPcYarnsStateCopyWith<$Res>
    implements $FetchPcYarnsStateCopyWith<$Res> {
  factory _$$_FetchPcYarnsStateCopyWith(_$_FetchPcYarnsState value,
          $Res Function(_$_FetchPcYarnsState) then) =
      __$$_FetchPcYarnsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Yarn> yarns,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class __$$_FetchPcYarnsStateCopyWithImpl<$Res>
    extends _$FetchPcYarnsStateCopyWithImpl<$Res>
    implements _$$_FetchPcYarnsStateCopyWith<$Res> {
  __$$_FetchPcYarnsStateCopyWithImpl(
      _$_FetchPcYarnsState _value, $Res Function(_$_FetchPcYarnsState) _then)
      : super(_value, (v) => _then(v as _$_FetchPcYarnsState));

  @override
  _$_FetchPcYarnsState get _value => super._value as _$_FetchPcYarnsState;

  @override
  $Res call({
    Object? yarns = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_$_FetchPcYarnsState(
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

class _$_FetchPcYarnsState implements _FetchPcYarnsState {
  const _$_FetchPcYarnsState(
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
    return 'FetchPcYarnsState(yarns: $yarns, isLoading: $isLoading, error: $error, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPcYarnsState &&
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
  _$$_FetchPcYarnsStateCopyWith<_$_FetchPcYarnsState> get copyWith =>
      __$$_FetchPcYarnsStateCopyWithImpl<_$_FetchPcYarnsState>(
          this, _$identity);
}

abstract class _FetchPcYarnsState implements FetchPcYarnsState {
  const factory _FetchPcYarnsState(
      {required final List<Yarn> yarns,
      required final bool isLoading,
      required final Option<Failure> error,
      required final int expandedIndex}) = _$_FetchPcYarnsState;

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
  _$$_FetchPcYarnsStateCopyWith<_$_FetchPcYarnsState> get copyWith =>
      throw _privateConstructorUsedError;
}
