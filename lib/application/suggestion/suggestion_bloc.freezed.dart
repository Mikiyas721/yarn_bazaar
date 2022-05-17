// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'suggestion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestionState {
  Option<SuggestionType> get suggestionType =>
      throw _privateConstructorUsedError;
  Either<SuggestionBodyFailure, SuggestionBody> get suggestionBody =>
      throw _privateConstructorUsedError;
  bool get hasSubmitted => throw _privateConstructorUsedError;
  bool get isAddingSuggestion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionStateCopyWith<SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionStateCopyWith<$Res> {
  factory $SuggestionStateCopyWith(
          SuggestionState value, $Res Function(SuggestionState) then) =
      _$SuggestionStateCopyWithImpl<$Res>;
  $Res call(
      {Option<SuggestionType> suggestionType,
      Either<SuggestionBodyFailure, SuggestionBody> suggestionBody,
      bool hasSubmitted,
      bool isAddingSuggestion});
}

/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._value, this._then);

  final SuggestionState _value;
  // ignore: unused_field
  final $Res Function(SuggestionState) _then;

  @override
  $Res call({
    Object? suggestionType = freezed,
    Object? suggestionBody = freezed,
    Object? hasSubmitted = freezed,
    Object? isAddingSuggestion = freezed,
  }) {
    return _then(_value.copyWith(
      suggestionType: suggestionType == freezed
          ? _value.suggestionType
          : suggestionType // ignore: cast_nullable_to_non_nullable
              as Option<SuggestionType>,
      suggestionBody: suggestionBody == freezed
          ? _value.suggestionBody
          : suggestionBody // ignore: cast_nullable_to_non_nullable
              as Either<SuggestionBodyFailure, SuggestionBody>,
      hasSubmitted: hasSubmitted == freezed
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingSuggestion: isAddingSuggestion == freezed
          ? _value.isAddingSuggestion
          : isAddingSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SuggestionStateCopyWith<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  factory _$$_SuggestionStateCopyWith(
          _$_SuggestionState value, $Res Function(_$_SuggestionState) then) =
      __$$_SuggestionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<SuggestionType> suggestionType,
      Either<SuggestionBodyFailure, SuggestionBody> suggestionBody,
      bool hasSubmitted,
      bool isAddingSuggestion});
}

/// @nodoc
class __$$_SuggestionStateCopyWithImpl<$Res>
    extends _$SuggestionStateCopyWithImpl<$Res>
    implements _$$_SuggestionStateCopyWith<$Res> {
  __$$_SuggestionStateCopyWithImpl(
      _$_SuggestionState _value, $Res Function(_$_SuggestionState) _then)
      : super(_value, (v) => _then(v as _$_SuggestionState));

  @override
  _$_SuggestionState get _value => super._value as _$_SuggestionState;

  @override
  $Res call({
    Object? suggestionType = freezed,
    Object? suggestionBody = freezed,
    Object? hasSubmitted = freezed,
    Object? isAddingSuggestion = freezed,
  }) {
    return _then(_$_SuggestionState(
      suggestionType: suggestionType == freezed
          ? _value.suggestionType
          : suggestionType // ignore: cast_nullable_to_non_nullable
              as Option<SuggestionType>,
      suggestionBody: suggestionBody == freezed
          ? _value.suggestionBody
          : suggestionBody // ignore: cast_nullable_to_non_nullable
              as Either<SuggestionBodyFailure, SuggestionBody>,
      hasSubmitted: hasSubmitted == freezed
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingSuggestion: isAddingSuggestion == freezed
          ? _value.isAddingSuggestion
          : isAddingSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SuggestionState implements _SuggestionState {
  const _$_SuggestionState(
      {required this.suggestionType,
      required this.suggestionBody,
      required this.hasSubmitted,
      required this.isAddingSuggestion});

  @override
  final Option<SuggestionType> suggestionType;
  @override
  final Either<SuggestionBodyFailure, SuggestionBody> suggestionBody;
  @override
  final bool hasSubmitted;
  @override
  final bool isAddingSuggestion;

  @override
  String toString() {
    return 'SuggestionState(suggestionType: $suggestionType, suggestionBody: $suggestionBody, hasSubmitted: $hasSubmitted, isAddingSuggestion: $isAddingSuggestion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionState &&
            const DeepCollectionEquality()
                .equals(other.suggestionType, suggestionType) &&
            const DeepCollectionEquality()
                .equals(other.suggestionBody, suggestionBody) &&
            const DeepCollectionEquality()
                .equals(other.hasSubmitted, hasSubmitted) &&
            const DeepCollectionEquality()
                .equals(other.isAddingSuggestion, isAddingSuggestion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(suggestionType),
      const DeepCollectionEquality().hash(suggestionBody),
      const DeepCollectionEquality().hash(hasSubmitted),
      const DeepCollectionEquality().hash(isAddingSuggestion));

  @JsonKey(ignore: true)
  @override
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      __$$_SuggestionStateCopyWithImpl<_$_SuggestionState>(this, _$identity);
}

abstract class _SuggestionState implements SuggestionState {
  const factory _SuggestionState(
      {required final Option<SuggestionType> suggestionType,
      required final Either<SuggestionBodyFailure, SuggestionBody>
          suggestionBody,
      required final bool hasSubmitted,
      required final bool isAddingSuggestion}) = _$_SuggestionState;

  @override
  Option<SuggestionType> get suggestionType =>
      throw _privateConstructorUsedError;
  @override
  Either<SuggestionBodyFailure, SuggestionBody> get suggestionBody =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmitted => throw _privateConstructorUsedError;
  @override
  bool get isAddingSuggestion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}
