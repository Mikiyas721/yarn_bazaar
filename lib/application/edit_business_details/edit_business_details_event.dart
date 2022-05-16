part of 'edit_business_details_bloc.dart';

abstract class EditBusinessDetailsEvent extends BlocEvent<EditBusinessDetailsState> {}

class EditBusinessDetailsStartedLoadingSavedEvent extends EditBusinessDetailsEvent {
  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(isLoadingSaved: true);
  }
}

class EditBusinessDetailsStoppedLoadingSavedEvent extends EditBusinessDetailsEvent {
  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(isLoadingSaved: false);
  }
}

class EditBusinessDetailsSavedBusinessDetailEvent extends EditBusinessDetailsEvent {
  final Option<BusinessDetail> loadedBusinessDetail;

  EditBusinessDetailsSavedBusinessDetailEvent(this.loadedBusinessDetail);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(loadedBusinessDetail: loadedBusinessDetail);
  }
}

class EditBusinessDetailsFailureChangedEvent extends EditBusinessDetailsEvent {
  final Option<Failure> failure;

  EditBusinessDetailsFailureChangedEvent(this.failure);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(loadingSavedFailure: failure);
  }
}

class EditBusinessDetailsCompanyNameChangedEvent extends EditBusinessDetailsEvent {
  final String companyName;

  EditBusinessDetailsCompanyNameChangedEvent(this.companyName);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(companyName: CompanyName.create(companyName));
  }
}

class EditBusinessDetailsAccountTypeChangedEvent extends EditBusinessDetailsEvent {
  final String accountType;

  EditBusinessDetailsAccountTypeChangedEvent(this.accountType);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(accountType: accountType);
  }
}

class EditBusinessDetailsCategoriesChangedEvent extends EditBusinessDetailsEvent {
  final List<String> categories;

  EditBusinessDetailsCategoriesChangedEvent(this.categories);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(categories: categories);
  }
}

class EditBusinessDetailsAddressChangedEvent extends EditBusinessDetailsEvent {
  final String address;

  EditBusinessDetailsAddressChangedEvent(this.address);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(address: address);
  }
}

class EditBusinessDetailsCompleteAddressChangedEvent extends EditBusinessDetailsEvent {
  final String completeAddress;

  EditBusinessDetailsCompleteAddressChangedEvent(this.completeAddress);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(completeAddress: completeAddress);
  }
}

class EditBusinessDetailsGSTNoChangedEvent extends EditBusinessDetailsEvent {
  final String gstNo;

  EditBusinessDetailsGSTNoChangedEvent(this.gstNo);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(gstNo: GSTNumber.create(gstNo));
  }
}

class EditBusinessDetailsTANNoChangedEvent extends EditBusinessDetailsEvent {
  final String tanNo;

  EditBusinessDetailsTANNoChangedEvent(this.tanNo);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(tanNo: TANNumber.create(tanNo));
  }
}

class EditBusinessDetailsPANNoChangedEvent extends EditBusinessDetailsEvent {
  final String panNo;

  EditBusinessDetailsPANNoChangedEvent(this.panNo);

  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(panNo: PANNumber.create(panNo));
  }
}

class EditBusinessDetailsSubmittedEvent extends EditBusinessDetailsEvent {
  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class EditBusinessDetailsStartedSavingEvent extends EditBusinessDetailsEvent {
  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(isSaving: true);
  }
}

class EditBusinessDetailsStoppedSavingEvent extends EditBusinessDetailsEvent {
  @override
  EditBusinessDetailsState handle(EditBusinessDetailsState currentState)  {
    return currentState.copyWith(isSaving: false);
  }
}
