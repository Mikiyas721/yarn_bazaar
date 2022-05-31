part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends BlocEvent<ResetPasswordState>{}

class ResetPasswordOldPasswordChangedEvent extends ResetPasswordEvent {
  final String password;

  ResetPasswordOldPasswordChangedEvent(this.password);

  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(oldPassword: Password.create(password));
  }
}

class ResetPasswordOldPasswordVisibilityChangedEvent extends ResetPasswordEvent {
  final bool showPassword;

  ResetPasswordOldPasswordVisibilityChangedEvent(this.showPassword);

  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(isShowingOldPassword: showPassword);
  }
}

class ResetPasswordNewPasswordChangedEvent extends ResetPasswordEvent {
  final String password;

  ResetPasswordNewPasswordChangedEvent(this.password);

  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(newPassword: Password.create(password));
  }
}

class ResetPasswordNewPasswordVisibilityChangedEvent extends ResetPasswordEvent {
  final bool showPassword;

  ResetPasswordNewPasswordVisibilityChangedEvent(this.showPassword);

  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(isShowingNewPassword: showPassword);
  }
}

class ResetPasswordHasSubmittedEvent extends ResetPasswordEvent {
  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class ResetPasswordStartedSavingEvent extends ResetPasswordEvent {
  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(isSaving: true);
  }
}

class ResetPasswordStoppedSavingEvent extends ResetPasswordEvent {
  @override
  ResetPasswordState handle(ResetPasswordState currentState)  {
    return currentState.copyWith(isSaving: false);
  }
}
