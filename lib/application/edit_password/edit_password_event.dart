part of 'edit_password_bloc.dart';

abstract class EditPasswordEvent extends BlocEvent<EditPasswordState> {}

class EditPasswordOldPasswordChangedEvent extends EditPasswordEvent {
  final String password;

  EditPasswordOldPasswordChangedEvent(this.password);

  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(oldPassword: Password.create(password));
  }
}

class EditPasswordOldPasswordVisibilityChangedEvent extends EditPasswordEvent {
  final bool showPassword;

  EditPasswordOldPasswordVisibilityChangedEvent(this.showPassword);

  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(isShowingOldPassword: showPassword);
  }
}

class EditPasswordNewPasswordChangedEvent extends EditPasswordEvent {
  final String password;

  EditPasswordNewPasswordChangedEvent(this.password);

  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(newPassword: Password.create(password));
  }
}

class EditPasswordNewPasswordVisibilityChangedEvent extends EditPasswordEvent {
  final bool showPassword;

  EditPasswordNewPasswordVisibilityChangedEvent(this.showPassword);

  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(isShowingNewPassword: showPassword);
  }
}

class EditPasswordHasSubmittedEvent extends EditPasswordEvent {
  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(hasSubmitted: true);
  }
}

class EditPasswordStartedSavingEvent extends EditPasswordEvent {
  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(isSaving: true);
  }
}

class EditPasswordStoppedSavingEvent extends EditPasswordEvent {
  @override
  Stream<EditPasswordState> handle(EditPasswordState currentState) async* {
    yield currentState.copyWith(isSaving: false);
  }
}
