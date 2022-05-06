part of 'sign_in_bloc.dart';

abstract class SignInEvent extends BlocEvent<SignInState> {}

class SignInPhoneNumberChangedEvent extends SignInEvent {
  final String phoneNumber;

  SignInPhoneNumberChangedEvent(this.phoneNumber);

  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(phoneNumber: PhoneNumber.create(phoneNumber));
  }
}

class SignInPasswordChangedEvent extends SignInEvent {
  final String password;

  SignInPasswordChangedEvent(this.password);

  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(password: Password.create(password));
  }
}

class SignInShowPasswordChangedEvent extends SignInEvent {
  final bool showPassword;

  SignInShowPasswordChangedEvent(this.showPassword);

  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(showPassword: showPassword);
  }
}

class SignInPasswordVisibilityChangedEvent extends SignInEvent {
  final bool isVisible;

  SignInPasswordVisibilityChangedEvent(this.isVisible);

  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(isShowingPassword: isVisible);
  }
}

class SignInSubmittedCredentialsEvent extends SignInEvent {
  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(hasSubmittedCredentials: true);
  }
}

class SignInIsVerifyingCredentialsChangedEvent extends SignInEvent {
  final bool isVerifying;

  SignInIsVerifyingCredentialsChangedEvent(this.isVerifying);

  @override
  Stream<SignInState> handle(SignInState currentState) async* {
    yield currentState.copyWith(isVerifyingCredentials: isVerifying);
  }
}
