part of 'edit_business_details_bloc.dart';

abstract class EditBusinessDetailsEvent extends BlocEvent<EditBusinessDetailsState> {}

class EditBusinessDetailsStartedLoadingSavedEvent extends EditBusinessDetailsEvent {
  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(isLoadingSaved: true);
  }
}

class EditBusinessDetailsStoppedLoadingSavedEvent extends EditBusinessDetailsEvent {
  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(isLoadingSaved: false);
  }
}

class EditBusinessDetailsCompanyNameChangedEvent extends EditBusinessDetailsEvent {
  final String companyName;

  EditBusinessDetailsCompanyNameChangedEvent(this.companyName);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(companyName: CompanyName.create(companyName));
  }
}

class EditBusinessDetailsAccountTypeChangedEvent extends EditBusinessDetailsEvent {
  final String accountType;

  EditBusinessDetailsAccountTypeChangedEvent(this.accountType);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(accountType: accountType);
  }
}

class EditBusinessDetailsAddressChangedEvent extends EditBusinessDetailsEvent {
  final String address;

  EditBusinessDetailsAddressChangedEvent(this.address);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(address: address);
  }
}

class EditBusinessDetailsCompleteAddressChangedEvent extends EditBusinessDetailsEvent {
  final String completeAddress;

  EditBusinessDetailsCompleteAddressChangedEvent(this.completeAddress);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(completeAddress: completeAddress);
  }
}

class EditBusinessDetailsGSTNoChangedEvent extends EditBusinessDetailsEvent {
  final String gstNo;

  EditBusinessDetailsGSTNoChangedEvent(this.gstNo);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(gstNo: GSTNumber.create(gstNo));
  }
}

class EditBusinessDetailsTANNoChangedEvent extends EditBusinessDetailsEvent {
  final String tanNo;

  EditBusinessDetailsTANNoChangedEvent(this.tanNo);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(tanNo: TANNumber.create(tanNo));
  }
}

class EditBusinessDetailsPANNoChangedEvent extends EditBusinessDetailsEvent {
  final String panNo;

  EditBusinessDetailsPANNoChangedEvent(this.panNo);

  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(panNo: PANNumber.create(panNo));
  }
}

class EditBusinessDetailsSubmittedEvent extends EditBusinessDetailsEvent {
  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(hasSubmitted: true);
  }
}

class EditBusinessDetailsStartedSavingEvent extends EditBusinessDetailsEvent {
  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(isSaving: true);
  }
}

class EditBusinessDetailsStoppedSavingEvent extends EditBusinessDetailsEvent {
  @override
  Stream<EditBusinessDetailsState> handle(EditBusinessDetailsState currentState) async* {
    yield currentState.copyWith(isSaving: false);
  }
}
