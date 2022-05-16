part of 'edit_bank_details_bloc.dart';

abstract class EditBankDetailsEvent extends BlocEvent<EditBankDetailsState> {}

class EditBankDetailsStartedLoadingPreviousEvent extends EditBankDetailsEvent {
  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(isLoadingSaved: true);
  }
}

class EditBankDetailsStoppedLoadingPreviousEvent extends EditBankDetailsEvent {
  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(isLoadingSaved: false);
  }
}

class EditBankDetailsSavedBankDetailChangedEvent extends EditBankDetailsEvent {
  final Option<BankDetail> loadedBankDetail;

  EditBankDetailsSavedBankDetailChangedEvent(this.loadedBankDetail);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(loadedBankDetails: loadedBankDetail);
  }
}

class EditBankDetailsFailureChangedEvent extends EditBankDetailsEvent {
  final Option<Failure> failure;

  EditBankDetailsFailureChangedEvent(this.failure);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(loadingSavedFailure: failure);
  }
}

class EditBankDetailsAccountNameChangedEvent extends EditBankDetailsEvent {
  final String? accountName;

  EditBankDetailsAccountNameChangedEvent(this.accountName);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(accountName: accountName);
  }
}

class EditBankDetailsAccountNumberChangedEvent extends EditBankDetailsEvent {
  final String? accountNumber;

  EditBankDetailsAccountNumberChangedEvent(this.accountNumber);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(accountNumber: AccountNumber.create(accountNumber));
  }
}

class EditBankDetailsIFSCCodeChangedEvent extends EditBankDetailsEvent {
  final String? iFSCCode;

  EditBankDetailsIFSCCodeChangedEvent(this.iFSCCode);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(iFSCCode: IFSCCode.create(iFSCCode));
  }
}

class EditBankDetailsBankNameChangedEvent extends EditBankDetailsEvent {
  final String? bankName;

  EditBankDetailsBankNameChangedEvent(this.bankName);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(bankName: bankName);
  }
}

class EditBankDetailsBankBranchChangedEvent extends EditBankDetailsEvent {
  final String? bankBranch;

  EditBankDetailsBankBranchChangedEvent(this.bankBranch);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(bankBranch: bankBranch);
  }
}

class EditBankDetailsBankStateChangedEvent extends EditBankDetailsEvent {
  final String? bankState;

  EditBankDetailsBankStateChangedEvent(this.bankState);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(bankState: bankState);
  }
}

class EditBankDetailsBankCityChangedEvent extends EditBankDetailsEvent {
  final String? bankCity;

  EditBankDetailsBankCityChangedEvent(this.bankCity);

  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(bankCity: bankCity);
  }
}

class EditBankDetailsSubmittedEvent extends EditBankDetailsEvent {
  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class EditBankDetailsStartedSavingEvent extends EditBankDetailsEvent {
  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(isSaving: true);
  }
}

class EditBankDetailsStoppedSavingEvent extends EditBankDetailsEvent {
  @override
  EditBankDetailsState handle(EditBankDetailsState currentState)  {
    return currentState.copyWith(isSaving: false);
  }
}
