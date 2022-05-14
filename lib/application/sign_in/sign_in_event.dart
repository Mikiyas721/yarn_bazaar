part of 'sign_in_bloc.dart';

abstract class SignInEvent extends BlocEvent<SignInState> {}

class SignInPhoneNumberChangedEvent extends SignInEvent {
  final String phoneNumber;

  SignInPhoneNumberChangedEvent(this.phoneNumber);

  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(phoneNumber: PhoneNumber.create(phoneNumber));
  }
}

class SignInPasswordChangedEvent extends SignInEvent {
  final String password;

  SignInPasswordChangedEvent(this.password);

  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(password: Password.create(password));
  }
}

class SignInPasswordVisibilityChangedEvent extends SignInEvent {
  final bool isVisible;

  SignInPasswordVisibilityChangedEvent(this.isVisible);

  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(isShowingPassword: isVisible);
  }
}

class SignInSubmittedCredentialsEvent extends SignInEvent {
  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(hasSubmittedCredentials: true);
  }
}

class SignInVerifyingCredentialsStartedEvent extends SignInEvent {
  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(isVerifyingCredentials: true);
  }
}

class SignInVerifyingCredentialsStoppedEvent extends SignInEvent {
  @override
  SignInState handle(SignInState currentState)  {
    return currentState.copyWith(isVerifyingCredentials: false);
  }
}
