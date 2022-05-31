part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState extends BlocState
    with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
    required bool hasSubmittedPhoneNumber,
    required bool isGeneratingOTP,
    required bool hasGeneratedOTP,
    required Either<VerificationCodeFailure, VerificationCode> oTP,
    required bool hasSubmittedOTP,
    required bool isVerifyingOTP,
  }) = _ForgotPassword;

  factory ForgotPasswordState.initial() => ForgotPasswordState(
        phoneNumber: PhoneNumber.create(''),
        hasSubmittedPhoneNumber: false,
        isGeneratingOTP: false,
        hasGeneratedOTP: false,
        oTP: VerificationCode.createFromString(''),
        hasSubmittedOTP: false,
        isVerifyingOTP: false,
      );
}
