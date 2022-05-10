part of 'edit_bank_details_bloc.dart';

abstract class EditBankDetailsEvent extends BlocEvent<EditBankDetailsState> {}

class EditBankDetailsStartedLoadingPreviousEvent extends EditBankDetailsEvent {
  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(isLoadingSaved: true);
  }
}

class EditBankDetailsStoppedLoadingPreviousEvent extends EditBankDetailsEvent {
  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(isLoadingSaved: false);
  }
}

class EditBankDetailsAccountNameChangedEvent extends EditBankDetailsEvent {
  final String accountName;

  EditBankDetailsAccountNameChangedEvent(this.accountName);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(accountName: accountName);
  }
}

class EditBankDetailsAccountNumberChangedEvent extends EditBankDetailsEvent {
  final String accountNumber;

  EditBankDetailsAccountNumberChangedEvent(this.accountNumber);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(accountNumber: AccountNumber.create(accountNumber));
  }
}

class EditBankDetailsIFSCCodeChangedEvent extends EditBankDetailsEvent {
  final String iFSCCode;

  EditBankDetailsIFSCCodeChangedEvent(this.iFSCCode);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(iFSCCode: IFSCCode.create(iFSCCode));
  }
}

class EditBankDetailsBankNameChangedEvent extends EditBankDetailsEvent {
  final String bankName;

  EditBankDetailsBankNameChangedEvent(this.bankName);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(bankName: bankName);
  }
}

class EditBankDetailsBankBranchChangedEvent extends EditBankDetailsEvent {
  final String bankBranch;

  EditBankDetailsBankBranchChangedEvent(this.bankBranch);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(bankBranch: bankBranch);
  }
}

class EditBankDetailsBankStateChangedEvent extends EditBankDetailsEvent {
  final String bankState;

  EditBankDetailsBankStateChangedEvent(this.bankState);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(bankState: bankState);
  }
}

class EditBankDetailsBankCityChangedEvent extends EditBankDetailsEvent {
  final String bankCity;

  EditBankDetailsBankCityChangedEvent(this.bankCity);

  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(bankCity: bankCity);
  }
}

class EditBankDetailsSubmittedEvent extends EditBankDetailsEvent {
  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(hasSubmitted: true);
  }
}

class EditBankDetailsStartedSavingEvent extends EditBankDetailsEvent {
  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(isSaving: true);
  }
}

class EditBankDetailsStoppedSavingEvent extends EditBankDetailsEvent {
  @override
  Stream<EditBankDetailsState> handle(EditBankDetailsState currentState) async* {
    yield currentState.copyWith(isSaving: false);
  }
}
