part of 'edit_basic_information_bloc.dart';

abstract class EditBasicInformationEvent extends BlocEvent<EditBasicInformationState> {}

class EditBasicInformationStartedLoadingSavedEvent extends EditBasicInformationEvent {
  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(isLoadingSaved: true);
  }
}

class EditBasicInformationStoppedLoadingSavedEvent extends EditBasicInformationEvent {
  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(isLoadingSaved: false);
  }
}

class EditBasicInformationFailureChangedEvent extends EditBasicInformationEvent {
  final Option<Failure> failure;

  EditBasicInformationFailureChangedEvent(this.failure);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(failure: failure);
  }
}

class EditBasicInformationFirstNameChangedEvent extends EditBasicInformationEvent {
  final String name;

  EditBasicInformationFirstNameChangedEvent(this.name);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(firstName: Name.create(name));
  }
}

class EditBasicInformationLastNameChangedEvent extends EditBasicInformationEvent {
  final String name;

  EditBasicInformationLastNameChangedEvent(this.name);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(lastName: Name.create(name));
  }
}

class EditBasicInformationInBusinessSinceChangedEvent extends EditBasicInformationEvent {
  final String year;

  EditBasicInformationInBusinessSinceChangedEvent(this.year);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(inBusinessSince: Year.create(year));
  }
}

class EditBasicInformationPrimaryNumberChangedEvent extends EditBasicInformationEvent {
  final String phoneNumber;

  EditBasicInformationPrimaryNumberChangedEvent(this.phoneNumber);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(primaryNumber: PhoneNumber.create(phoneNumber));
  }
}

class EditBasicInformationCountryChangedEvent extends EditBasicInformationEvent {
  final String country;

  EditBasicInformationCountryChangedEvent(this.country);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(country: country);
  }
}

class EditBasicInformationCityChangedEvent extends EditBasicInformationEvent {
  final String city;

  EditBasicInformationCityChangedEvent(this.city);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(city: city);
  }
}

class EditBasicInformationEmailChangedEvent extends EditBasicInformationEvent {
  final String email;

  EditBasicInformationEmailChangedEvent(this.email);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(email: Email.create(email));
  }
}

class EditBasicInformationWebsiteUrlChangedEvent extends EditBasicInformationEvent {
  final String websiteUrl;

  EditBasicInformationWebsiteUrlChangedEvent(this.websiteUrl);

  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(website: WebsiteUrl.create(websiteUrl));
  }
}

class EditBasicInformationSubmittedEvent extends EditBasicInformationEvent {
  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class EditBasicInformationStartedSavingEvent extends EditBasicInformationEvent {
  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(isSaving: true);
  }
}

class EditBasicInformationStoppedSavingEvent extends EditBasicInformationEvent {
  @override
  EditBasicInformationState handle(EditBasicInformationState currentState)  {
    return currentState.copyWith(isSaving: false);
  }
}
