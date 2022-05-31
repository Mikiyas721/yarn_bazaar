part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends BlocEvent<ForgotPasswordState> {}

class ForgotPasswordPhoneNumberChangedEvent extends ForgotPasswordEvent {
  final String phoneNumber;

  ForgotPasswordPhoneNumberChangedEvent(this.phoneNumber);

  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(phoneNumber: PhoneNumber.create(phoneNumber));
  }
}

class ForgotPasswordSubmittedPhoneNumberEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(hasSubmittedPhoneNumber: true);
  }
}

class ForgotPasswordStartedGeneratingOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(isGeneratingOTP: true);
  }
}

class ForgotPasswordStoppedGeneratingOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(isGeneratingOTP: false);
  }
}

class ForgotPasswordGeneratedOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(hasGeneratedOTP: true);
  }
}

class ForgotPasswordOTPChangedEvent extends ForgotPasswordEvent {
  final String oTP;

  ForgotPasswordOTPChangedEvent(this.oTP);

  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(oTP: VerificationCode.createFromString(oTP));
  }
}

class ForgotPasswordSubmittedOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(hasSubmittedOTP: true);
  }
}

class ForgotPasswordStartedVerifyingOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(isVerifyingOTP: true);
  }
}

class ForgotPasswordStoppedVerifyingOTPEvent extends ForgotPasswordEvent {
  @override
  ForgotPasswordState handle(ForgotPasswordState currentState) {
    return currentState.copyWith(isVerifyingOTP: false);
  }
}