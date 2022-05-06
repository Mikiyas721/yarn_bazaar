part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends BlocEvent<SignUpState> {}

class SignUpActiveIndexChangedEvent extends SignUpEvent {
  final int activeIndex;

  SignUpActiveIndexChangedEvent(this.activeIndex);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(activeStepIndex: activeIndex);
  }
}

class SignUpPhoneNumberChangedEvent extends SignUpEvent {
  final String phoneNumber;

  SignUpPhoneNumberChangedEvent(this.phoneNumber);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(phoneNumber: PhoneNumber.create(phoneNumber));
  }
}

class SignUpAgreedToTermsChangedEvent extends SignUpEvent {
  final bool hasAgreed;

  SignUpAgreedToTermsChangedEvent(this.hasAgreed);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(hasAgreedToTerms: hasAgreed);
  }
}

class SignUpIsGeneratingOTPChangedEvent extends SignUpEvent {
  final bool isGeneratingOTP;

  SignUpIsGeneratingOTPChangedEvent(this.isGeneratingOTP);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(isGeneratingOTP: isGeneratingOTP);
  }
}

class SignUpGeneratedOTPEvent extends SignUpEvent {
  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(hasGeneratedOTP: true);
  }
}

class SignUpGeneratedOTPChangedEvent extends SignUpEvent {
  final String generatedOTP;

  SignUpGeneratedOTPChangedEvent(this.generatedOTP);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(generatedOTP: generatedOTP);
  }
}

class SignUpUserEnteredOTPChangedEvent extends SignUpEvent {
  final String userEnteredOTP;

  SignUpUserEnteredOTPChangedEvent(this.userEnteredOTP);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(
        userEnteredOTP: VerificationCode.createFromString(userEnteredOTP));
  }
}

class SignUpUserTypeChangedEvent extends SignUpEvent {
  final String userTypeChanged;

  SignUpUserTypeChangedEvent(this.userTypeChanged);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(userType: UserType.create(userTypeChanged));
  }
}

class SignUpOtherUserTypeChangedEvent extends SignUpEvent {
  final String otherUserTypeChanged;

  SignUpOtherUserTypeChangedEvent(this.otherUserTypeChanged);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(
        otherUserType: UserType.create(otherUserTypeChanged));
  }
}

class SignUpSubmittedUserTypeEvent extends SignUpEvent {
  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(hasSubmittedUserType: true);
  }
}

class SignUpSelectedCategoryChangedEvent extends SignUpEvent {
  final List<String> selectedCategory;

  SignUpSelectedCategoryChangedEvent(this.selectedCategory);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(yarnCategorySelected: selectedCategory);
  }
}

class SignUpFirstNameChangedEvent extends SignUpEvent {
  final String firstName;

  SignUpFirstNameChangedEvent(this.firstName);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(firstName: Name.create(firstName));
  }
}

class SignUpLastNameChangedEvent extends SignUpEvent {
  final String lastName;

  SignUpLastNameChangedEvent(this.lastName);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(lastName: Name.create(lastName));
  }
}

class SignUpCompanyNameChangedEvent extends SignUpEvent {
  final String companyName;

  SignUpCompanyNameChangedEvent(this.companyName);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(companyName: CompanyName.create(companyName));
  }
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String password;

  SignUpPasswordChangedEvent(this.password);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(password: Password.create(password));
  }
}

class SignUpSubmittedUserInformationEvent extends SignUpEvent {
  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(hasSubmittedUserType: true);
  }
}

class SignUpIsAddingUserChangedEvent extends SignUpEvent {
  final bool isAdding;

  SignUpIsAddingUserChangedEvent(this.isAdding);

  @override
  Stream<SignUpState> handle(SignUpState currentState) async* {
    yield currentState.copyWith(isAddingUser: isAdding);
  }
}
