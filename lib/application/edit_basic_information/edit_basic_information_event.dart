part of 'edit_basic_information_bloc.dart';

abstract class EditBasicInformationEvent extends BlocEvent<EditBasicInformationState> {}

class EditBasicInformationFirstNameChangedEvent extends EditBasicInformationEvent {
  final String name;

  EditBasicInformationFirstNameChangedEvent(this.name);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(firstName: Name.create(name));
  }
}

class EditBasicInformationLastNameChangedEvent extends EditBasicInformationEvent {
  final String name;

  EditBasicInformationLastNameChangedEvent(this.name);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(lastName: Name.create(name));
  }
}

class EditBasicInformationInBusinessSinceChangedEvent extends EditBasicInformationEvent {
  final String year;

  EditBasicInformationInBusinessSinceChangedEvent(this.year);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(inBusinessSince: Year.create(year));
  }
}

class EditBasicInformationPrimaryNumberChangedEvent extends EditBasicInformationEvent {
  final String phoneNumber;

  EditBasicInformationPrimaryNumberChangedEvent(this.phoneNumber);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(primaryNumber: PhoneNumber.create(phoneNumber));
  }
}

class EditBasicInformationCountryChangedEvent extends EditBasicInformationEvent {
  final String country;

  EditBasicInformationCountryChangedEvent(this.country);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(country: country);
  }
}

class EditBasicInformationCityChangedEvent extends EditBasicInformationEvent {
  final String city;

  EditBasicInformationCityChangedEvent(this.city);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(city: city);
  }
}

class EditBasicInformationEmailChangedEvent extends EditBasicInformationEvent {
  final String email;

  EditBasicInformationEmailChangedEvent(this.email);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(email: Email.create(email));
  }
}

class EditBasicInformationWebsiteUrlChangedEvent extends EditBasicInformationEvent {
  final String websiteUrl;

  EditBasicInformationWebsiteUrlChangedEvent(this.websiteUrl);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(website: WebsiteUrl.create(websiteUrl));
  }
}

class EditBasicInformationSubmittedEvent extends EditBasicInformationEvent {
  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(hasSubmitted: true);
  }
}

class EditBasicInformationIsSavingChangedEvent extends EditBasicInformationEvent {
  final bool isSaving;

  EditBasicInformationIsSavingChangedEvent(this.isSaving);

  @override
  Stream<EditBasicInformationState> handle(EditBasicInformationState currentState) async* {
    yield currentState.copyWith(isSaving: isSaving);
  }
}
