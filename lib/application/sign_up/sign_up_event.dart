part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends BlocEvent<SignUpState> {}

class SignUpActiveIndexChangedEvent extends SignUpEvent {
  final int activeIndex;

  SignUpActiveIndexChangedEvent(this.activeIndex);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(activeStepIndex: activeIndex);
  }
}

class SignUpPhoneNumberChangedEvent extends SignUpEvent {
  final String phoneNumber;

  SignUpPhoneNumberChangedEvent(this.phoneNumber);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(phoneNumber: PhoneNumber.create(phoneNumber));
  }
}

class SignUpAgreedToTermsChangedEvent extends SignUpEvent {
  final bool hasAgreed;

  SignUpAgreedToTermsChangedEvent(this.hasAgreed);

  @override
   handle(SignUpState currentState) {
    return currentState.copyWith(hasAgreedToTerms: hasAgreed);
  }
}

class SignUpSubmittedPhoneNumberEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(hasSubmittedPhoneNumber: true);
  }
}

class SignUpStartedGeneratingOTPEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(isGeneratingOTP: true);
  }
}

class SignUpStoppedGeneratingOTPEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(isGeneratingOTP: false);
  }
}

class SignUpGeneratedOTPEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(hasGeneratedOTP: true);
  }
}

class SignUpStartedVerifyingOTPChangedEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(isVerifyingOTP: true);
  }
}

class SignUpStoppedVerifyingOTPChangedEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(isVerifyingOTP: false);
  }
}

class SignUpGeneratedOTPChangedEvent extends SignUpEvent {
  final String generatedOTP;

  SignUpGeneratedOTPChangedEvent(this.generatedOTP);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(generatedOTP: generatedOTP);
  }
}

class SignUpUserEnteredOTPChangedEvent extends SignUpEvent {
  final String userEnteredOTP;

  SignUpUserEnteredOTPChangedEvent(this.userEnteredOTP);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(
        userEnteredOTP: VerificationCode.createFromString(userEnteredOTP));
  }
}

class SignUpUserTypeChangedEvent extends SignUpEvent {
  final UserType userType;

  SignUpUserTypeChangedEvent(this.userType);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(userType: userType);
  }
}

class SignUpOtherUserTypeChangedEvent extends SignUpEvent {
  final String otherUserType;

  SignUpOtherUserTypeChangedEvent(this.otherUserType);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(otherUserType: OtherUserType.create(otherUserType));
  }
}

class SignUpSubmittedUserTypeEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(hasSubmittedUserType: true);
  }
}

class SignUpSelectedCategoryChangedEvent extends SignUpEvent {
  final List<bool> selectedCategory;

  SignUpSelectedCategoryChangedEvent(this.selectedCategory);

  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(yarnCategorySelected: selectedCategory);
  }
}

class SignUpFirstNameChangedEvent extends SignUpEvent {
  final String firstName;

  SignUpFirstNameChangedEvent(this.firstName);

  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(firstName: Name.create(firstName));
  }
}

class SignUpLastNameChangedEvent extends SignUpEvent {
  final String lastName;

  SignUpLastNameChangedEvent(this.lastName);

  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(lastName: Name.create(lastName));
  }
}

class SignUpCompanyNameChangedEvent extends SignUpEvent {
  final String companyName;

  SignUpCompanyNameChangedEvent(this.companyName);

  @override
  SignUpState handle(SignUpState currentState) {
    return currentState.copyWith(companyName: CompanyName.create(companyName));
  }
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String password;

  SignUpPasswordChangedEvent(this.password);

  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(password: Password.create(password));
  }
}

class SignUpSubmittedUserInformationEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(hasSubmittedUserInformation: true);
  }
}

class SignUpStartedAddingUserChangedEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(isAddingUser: true);
  }
}

class SignUpStoppedAddingUserChangedEvent extends SignUpEvent {
  @override
  SignUpState handle(SignUpState currentState)  {
    return currentState.copyWith(isAddingUser: false);
  }
}
