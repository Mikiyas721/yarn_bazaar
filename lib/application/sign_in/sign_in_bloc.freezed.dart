// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  Either<PasswordFailure, Password> get password =>
      throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get isShowingPassword => throw _privateConstructorUsedError;
  bool get hasSubmittedCredentials => throw _privateConstructorUsedError;
  bool get isVerifyingCredentials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  $Res call(
      {Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      Either<PasswordFailure, Password> password,
      bool showPassword,
      bool isShowingPassword,
      bool hasSubmittedCredentials,
      bool isVerifyingCredentials});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? showPassword = freezed,
    Object? isShowingPassword = freezed,
    Object? hasSubmittedCredentials = freezed,
    Object? isVerifyingCredentials = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowingPassword: isShowingPassword == freezed
          ? _value.isShowingPassword
          : isShowingPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSubmittedCredentials: hasSubmittedCredentials == freezed
          ? _value.hasSubmittedCredentials
          : hasSubmittedCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingCredentials: isVerifyingCredentials == freezed
          ? _value.isVerifyingCredentials
          : isVerifyingCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
          _SignInState value, $Res Function(_SignInState) then) =
      __$SignInStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      Either<PasswordFailure, Password> password,
      bool showPassword,
      bool isShowingPassword,
      bool hasSubmittedCredentials,
      bool isVerifyingCredentials});
}

/// @nodoc
class __$SignInStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(
      _SignInState _value, $Res Function(_SignInState) _then)
      : super(_value, (v) => _then(v as _SignInState));

  @override
  _SignInState get _value => super._value as _SignInState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? showPassword = freezed,
    Object? isShowingPassword = freezed,
    Object? hasSubmittedCredentials = freezed,
    Object? isVerifyingCredentials = freezed,
  }) {
    return _then(_SignInState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowingPassword: isShowingPassword == freezed
          ? _value.isShowingPassword
          : isShowingPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSubmittedCredentials: hasSubmittedCredentials == freezed
          ? _value.hasSubmittedCredentials
          : hasSubmittedCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingCredentials: isVerifyingCredentials == freezed
          ? _value.isVerifyingCredentials
          : isVerifyingCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInState implements _SignInState {
  const _$_SignInState(
      {required this.phoneNumber,
      required this.password,
      required this.showPassword,
      required this.isShowingPassword,
      required this.hasSubmittedCredentials,
      required this.isVerifyingCredentials});

  @override
  final Either<PhoneNumberFailure, PhoneNumber> phoneNumber;
  @override
  final Either<PasswordFailure, Password> password;
  @override
  final bool showPassword;
  @override
  final bool isShowingPassword;
  @override
  final bool hasSubmittedCredentials;
  @override
  final bool isVerifyingCredentials;

  @override
  String toString() {
    return 'SignInState(phoneNumber: $phoneNumber, password: $password, showPassword: $showPassword, isShowingPassword: $isShowingPassword, hasSubmittedCredentials: $hasSubmittedCredentials, isVerifyingCredentials: $isVerifyingCredentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.showPassword, showPassword) &&
            const DeepCollectionEquality()
                .equals(other.isShowingPassword, isShowingPassword) &&
            const DeepCollectionEquality().equals(
                other.hasSubmittedCredentials, hasSubmittedCredentials) &&
            const DeepCollectionEquality()
                .equals(other.isVerifyingCredentials, isVerifyingCredentials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(showPassword),
      const DeepCollectionEquality().hash(isShowingPassword),
      const DeepCollectionEquality().hash(hasSubmittedCredentials),
      const DeepCollectionEquality().hash(isVerifyingCredentials));

  @JsonKey(ignore: true)
  @override
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {required final Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      required final Either<PasswordFailure, Password> password,
      required final bool showPassword,
      required final bool isShowingPassword,
      required final bool hasSubmittedCredentials,
      required final bool isVerifyingCredentials}) = _$_SignInState;

  @override
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  @override
  Either<PasswordFailure, Password> get password =>
      throw _privateConstructorUsedError;
  @override
  bool get showPassword => throw _privateConstructorUsedError;
  @override
  bool get isShowingPassword => throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedCredentials => throw _privateConstructorUsedError;
  @override
  bool get isVerifyingCredentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}
