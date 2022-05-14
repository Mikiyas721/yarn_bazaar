part of 'edit_password_bloc.dart';

abstract class EditPasswordEvent extends BlocEvent<EditPasswordState> {}

class EditPasswordOldPasswordChangedEvent extends EditPasswordEvent {
  final String password;

  EditPasswordOldPasswordChangedEvent(this.password);

  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(oldPassword: Password.create(password));
  }
}

class EditPasswordOldPasswordVisibilityChangedEvent extends EditPasswordEvent {
  final bool showPassword;

  EditPasswordOldPasswordVisibilityChangedEvent(this.showPassword);

  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(isShowingOldPassword: showPassword);
  }
}

class EditPasswordNewPasswordChangedEvent extends EditPasswordEvent {
  final String password;

  EditPasswordNewPasswordChangedEvent(this.password);

  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(newPassword: Password.create(password));
  }
}

class EditPasswordNewPasswordVisibilityChangedEvent extends EditPasswordEvent {
  final bool showPassword;

  EditPasswordNewPasswordVisibilityChangedEvent(this.showPassword);

  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(isShowingNewPassword: showPassword);
  }
}

class EditPasswordHasSubmittedEvent extends EditPasswordEvent {
  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class EditPasswordStartedSavingEvent extends EditPasswordEvent {
  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(isSaving: true);
  }
}

class EditPasswordStoppedSavingEvent extends EditPasswordEvent {
  @override
  EditPasswordState handle(EditPasswordState currentState)  {
    return currentState.copyWith(isSaving: false);
  }
}
