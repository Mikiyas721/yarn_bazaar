// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordState {
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedPhoneNumber => throw _privateConstructorUsedError;
  bool get isGeneratingOTP => throw _privateConstructorUsedError;
  bool get hasGeneratedOTP => throw _privateConstructorUsedError;
  Either<VerificationCodeFailure, VerificationCode> get oTP =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedOTP => throw _privateConstructorUsedError;
  bool get isVerifyingOTP => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      bool hasSubmittedPhoneNumber,
      bool isGeneratingOTP,
      bool hasGeneratedOTP,
      Either<VerificationCodeFailure, VerificationCode> oTP,
      bool hasSubmittedOTP,
      bool isVerifyingOTP});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  final ForgotPasswordState _value;
  // ignore: unused_field
  final $Res Function(ForgotPasswordState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? hasSubmittedPhoneNumber = freezed,
    Object? isGeneratingOTP = freezed,
    Object? hasGeneratedOTP = freezed,
    Object? oTP = freezed,
    Object? hasSubmittedOTP = freezed,
    Object? isVerifyingOTP = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      hasSubmittedPhoneNumber: hasSubmittedPhoneNumber == freezed
          ? _value.hasSubmittedPhoneNumber
          : hasSubmittedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingOTP: isGeneratingOTP == freezed
          ? _value.isGeneratingOTP
          : isGeneratingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      hasGeneratedOTP: hasGeneratedOTP == freezed
          ? _value.hasGeneratedOTP
          : hasGeneratedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      oTP: oTP == freezed
          ? _value.oTP
          : oTP // ignore: cast_nullable_to_non_nullable
              as Either<VerificationCodeFailure, VerificationCode>,
      hasSubmittedOTP: hasSubmittedOTP == freezed
          ? _value.hasSubmittedOTP
          : hasSubmittedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingOTP: isVerifyingOTP == freezed
          ? _value.isVerifyingOTP
          : isVerifyingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$_ForgotPasswordCopyWith(
          _$_ForgotPassword value, $Res Function(_$_ForgotPassword) then) =
      __$$_ForgotPasswordCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      bool hasSubmittedPhoneNumber,
      bool isGeneratingOTP,
      bool hasGeneratedOTP,
      Either<VerificationCodeFailure, VerificationCode> oTP,
      bool hasSubmittedOTP,
      bool isVerifyingOTP});
}

/// @nodoc
class __$$_ForgotPasswordCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res>
    implements _$$_ForgotPasswordCopyWith<$Res> {
  __$$_ForgotPasswordCopyWithImpl(
      _$_ForgotPassword _value, $Res Function(_$_ForgotPassword) _then)
      : super(_value, (v) => _then(v as _$_ForgotPassword));

  @override
  _$_ForgotPassword get _value => super._value as _$_ForgotPassword;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? hasSubmittedPhoneNumber = freezed,
    Object? isGeneratingOTP = freezed,
    Object? hasGeneratedOTP = freezed,
    Object? oTP = freezed,
    Object? hasSubmittedOTP = freezed,
    Object? isVerifyingOTP = freezed,
  }) {
    return _then(_$_ForgotPassword(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      hasSubmittedPhoneNumber: hasSubmittedPhoneNumber == freezed
          ? _value.hasSubmittedPhoneNumber
          : hasSubmittedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingOTP: isGeneratingOTP == freezed
          ? _value.isGeneratingOTP
          : isGeneratingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      hasGeneratedOTP: hasGeneratedOTP == freezed
          ? _value.hasGeneratedOTP
          : hasGeneratedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      oTP: oTP == freezed
          ? _value.oTP
          : oTP // ignore: cast_nullable_to_non_nullable
              as Either<VerificationCodeFailure, VerificationCode>,
      hasSubmittedOTP: hasSubmittedOTP == freezed
          ? _value.hasSubmittedOTP
          : hasSubmittedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingOTP: isVerifyingOTP == freezed
          ? _value.isVerifyingOTP
          : isVerifyingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ForgotPassword implements _ForgotPassword {
  const _$_ForgotPassword(
      {required this.phoneNumber,
      required this.hasSubmittedPhoneNumber,
      required this.isGeneratingOTP,
      required this.hasGeneratedOTP,
      required this.oTP,
      required this.hasSubmittedOTP,
      required this.isVerifyingOTP});

  @override
  final Either<PhoneNumberFailure, PhoneNumber> phoneNumber;
  @override
  final bool hasSubmittedPhoneNumber;
  @override
  final bool isGeneratingOTP;
  @override
  final bool hasGeneratedOTP;
  @override
  final Either<VerificationCodeFailure, VerificationCode> oTP;
  @override
  final bool hasSubmittedOTP;
  @override
  final bool isVerifyingOTP;

  @override
  String toString() {
    return 'ForgotPasswordState(phoneNumber: $phoneNumber, hasSubmittedPhoneNumber: $hasSubmittedPhoneNumber, isGeneratingOTP: $isGeneratingOTP, hasGeneratedOTP: $hasGeneratedOTP, oTP: $oTP, hasSubmittedOTP: $hasSubmittedOTP, isVerifyingOTP: $isVerifyingOTP)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPassword &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(
                other.hasSubmittedPhoneNumber, hasSubmittedPhoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.isGeneratingOTP, isGeneratingOTP) &&
            const DeepCollectionEquality()
                .equals(other.hasGeneratedOTP, hasGeneratedOTP) &&
            const DeepCollectionEquality().equals(other.oTP, oTP) &&
            const DeepCollectionEquality()
                .equals(other.hasSubmittedOTP, hasSubmittedOTP) &&
            const DeepCollectionEquality()
                .equals(other.isVerifyingOTP, isVerifyingOTP));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(hasSubmittedPhoneNumber),
      const DeepCollectionEquality().hash(isGeneratingOTP),
      const DeepCollectionEquality().hash(hasGeneratedOTP),
      const DeepCollectionEquality().hash(oTP),
      const DeepCollectionEquality().hash(hasSubmittedOTP),
      const DeepCollectionEquality().hash(isVerifyingOTP));

  @JsonKey(ignore: true)
  @override
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      __$$_ForgotPasswordCopyWithImpl<_$_ForgotPassword>(this, _$identity);
}

abstract class _ForgotPassword implements ForgotPasswordState {
  const factory _ForgotPassword(
      {required final Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      required final bool hasSubmittedPhoneNumber,
      required final bool isGeneratingOTP,
      required final bool hasGeneratedOTP,
      required final Either<VerificationCodeFailure, VerificationCode> oTP,
      required final bool hasSubmittedOTP,
      required final bool isVerifyingOTP}) = _$_ForgotPassword;

  @override
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedPhoneNumber => throw _privateConstructorUsedError;
  @override
  bool get isGeneratingOTP => throw _privateConstructorUsedError;
  @override
  bool get hasGeneratedOTP => throw _privateConstructorUsedError;
  @override
  Either<VerificationCodeFailure, VerificationCode> get oTP =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedOTP => throw _privateConstructorUsedError;
  @override
  bool get isVerifyingOTP => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
