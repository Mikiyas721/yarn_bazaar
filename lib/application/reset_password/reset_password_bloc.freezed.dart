// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  Either<PasswordFailure, Password> get oldPassword =>
      throw _privateConstructorUsedError;
  bool get isShowingOldPassword => throw _privateConstructorUsedError;
  Either<PasswordFailure, Password> get newPassword =>
      throw _privateConstructorUsedError;
  bool get isShowingNewPassword => throw _privateConstructorUsedError;
  bool get hasSubmitted => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {Either<PasswordFailure, Password> oldPassword,
      bool isShowingOldPassword,
      Either<PasswordFailure, Password> newPassword,
      bool isShowingNewPassword,
      bool hasSubmitted,
      bool isSaving});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  final ResetPasswordState _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordState) _then;

  @override
  $Res call({
    Object? oldPassword = freezed,
    Object? isShowingOldPassword = freezed,
    Object? newPassword = freezed,
    Object? isShowingNewPassword = freezed,
    Object? hasSubmitted = freezed,
    Object? isSaving = freezed,
  }) {
    return _then(_value.copyWith(
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      isShowingOldPassword: isShowingOldPassword == freezed
          ? _value.isShowingOldPassword
          : isShowingOldPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      isShowingNewPassword: isShowingNewPassword == freezed
          ? _value.isShowingNewPassword
          : isShowingNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSubmitted: hasSubmitted == freezed
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordStateCopyWith(_$_ResetPasswordState value,
          $Res Function(_$_ResetPasswordState) then) =
      __$$_ResetPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<PasswordFailure, Password> oldPassword,
      bool isShowingOldPassword,
      Either<PasswordFailure, Password> newPassword,
      bool isShowingNewPassword,
      bool hasSubmitted,
      bool isSaving});
}

/// @nodoc
class __$$_ResetPasswordStateCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$$_ResetPasswordStateCopyWith<$Res> {
  __$$_ResetPasswordStateCopyWithImpl(
      _$_ResetPasswordState _value, $Res Function(_$_ResetPasswordState) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordState));

  @override
  _$_ResetPasswordState get _value => super._value as _$_ResetPasswordState;

  @override
  $Res call({
    Object? oldPassword = freezed,
    Object? isShowingOldPassword = freezed,
    Object? newPassword = freezed,
    Object? isShowingNewPassword = freezed,
    Object? hasSubmitted = freezed,
    Object? isSaving = freezed,
  }) {
    return _then(_$_ResetPasswordState(
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      isShowingOldPassword: isShowingOldPassword == freezed
          ? _value.isShowingOldPassword
          : isShowingOldPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      isShowingNewPassword: isShowingNewPassword == freezed
          ? _value.isShowingNewPassword
          : isShowingNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSubmitted: hasSubmitted == freezed
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordState implements _ResetPasswordState {
  const _$_ResetPasswordState(
      {required this.oldPassword,
      required this.isShowingOldPassword,
      required this.newPassword,
      required this.isShowingNewPassword,
      required this.hasSubmitted,
      required this.isSaving});

  @override
  final Either<PasswordFailure, Password> oldPassword;
  @override
  final bool isShowingOldPassword;
  @override
  final Either<PasswordFailure, Password> newPassword;
  @override
  final bool isShowingNewPassword;
  @override
  final bool hasSubmitted;
  @override
  final bool isSaving;

  @override
  String toString() {
    return 'ResetPasswordState(oldPassword: $oldPassword, isShowingOldPassword: $isShowingOldPassword, newPassword: $newPassword, isShowingNewPassword: $isShowingNewPassword, hasSubmitted: $hasSubmitted, isSaving: $isSaving)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordState &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword) &&
            const DeepCollectionEquality()
                .equals(other.isShowingOldPassword, isShowingOldPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.isShowingNewPassword, isShowingNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.hasSubmitted, hasSubmitted) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oldPassword),
      const DeepCollectionEquality().hash(isShowingOldPassword),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(isShowingNewPassword),
      const DeepCollectionEquality().hash(hasSubmitted),
      const DeepCollectionEquality().hash(isSaving));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      __$$_ResetPasswordStateCopyWithImpl<_$_ResetPasswordState>(
          this, _$identity);
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
      {required final Either<PasswordFailure, Password> oldPassword,
      required final bool isShowingOldPassword,
      required final Either<PasswordFailure, Password> newPassword,
      required final bool isShowingNewPassword,
      required final bool hasSubmitted,
      required final bool isSaving}) = _$_ResetPasswordState;

  @override
  Either<PasswordFailure, Password> get oldPassword =>
      throw _privateConstructorUsedError;
  @override
  bool get isShowingOldPassword => throw _privateConstructorUsedError;
  @override
  Either<PasswordFailure, Password> get newPassword =>
      throw _privateConstructorUsedError;
  @override
  bool get isShowingNewPassword => throw _privateConstructorUsedError;
  @override
  bool get hasSubmitted => throw _privateConstructorUsedError;
  @override
  bool get isSaving => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
