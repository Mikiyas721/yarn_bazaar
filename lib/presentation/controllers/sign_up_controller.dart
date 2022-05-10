import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/application/sign_up/sign_up_bloc.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/common/other_extensions.dart';

class SignUpController
    extends BlocViewModelController<SignUpBloc, SignUpEvent, SignUpState, SignUpViewModel>
    with ToastMixin {
  SignUpController(BuildContext context) : super(context, getIt.get<SignUpBloc>(), true);

  @override
  SignUpViewModel mapStateToViewModel(SignUpState s) {
    return SignUpViewModel(
      activeStepIndex: s.activeStepIndex,
      phoneNumber: s.phoneNumber.fold((l) => null, (r) => r.value),
      phoneNumberError:
          s.hasSubmittedPhoneNumber ? s.phoneNumber.fold((l) => l.message, (r) => null) : null,
      hasAgreedToTerms: s.hasAgreedToTerms,
      isGeneratingOTP: s.isGeneratingOTP,
      hasGeneratedOTP: s.hasGeneratedOTP,
      oTP: s.userEnteredOTP.fold((l) => null, (r) => r.value.toString()),
      oTPError:
          s.hasSubmittedOTP ? s.userEnteredOTP.fold((l) => l.message, (r) => null) : null,
      userTypeIndex: s.userType.index,
      otherUserType: s.otherUserType.fold((l) => null, (r) => r.value),
      otherUserTypeError:
          s.hasSubmittedUserType ? s.otherUserType.fold((l) => l.message, (r) => null) : null,
      yarnCategorySelected: s.yarnCategorySelected,
      firstName: s.firstName.fold((l) => null, (r) => r.value),
      firstNameError: s.hasSubmittedUserInformation
          ? s.firstName.fold((l) => l.message, (r) => null)
          : null,
      lastName: s.lastName.fold((l) => null, (r) => r.value),
      lastNameError: s.hasSubmittedUserInformation
          ? s.lastName.fold((l) {
              if (!(l is EmptyNameFailure)) {
                return l.message;
              }
              return null;
            }, (r) => null)
          : null,
      companyName: s.companyName.fold((l) => null, (r) => r.value),
      companyNameError: s.hasSubmittedUserInformation
          ? s.companyName.fold((l) => l.message, (r) => null)
          : null,
      password: s.password.fold((l) => null, (r) => r.value),
      passwordError: s.hasSubmittedUserInformation
          ? s.password.fold((l) => l.message, (r) => null)
          : null,
      isAddingUser: s.isAddingUser,
    );
  }

  String getTitle() {
    if (bloc.state.activeStepIndex == 0 && !bloc.state.hasGeneratedOTP)
      return 'Enter Mobile Number';
    else if (bloc.state.activeStepIndex == 0 && bloc.state.hasGeneratedOTP)
      return 'Enter OTP';
    else if (bloc.state.activeStepIndex == 1)
      return 'Select user type';
    else if (bloc.state.activeStepIndex == 2)
      return 'Select yarn categories';
    else if (bloc.state.activeStepIndex == 3)
      return 'Enter user information';
    else
      return '';
  }

  onPhoneNumber(String phoneNumber) {
    bloc.add(SignUpPhoneNumberChangedEvent(phoneNumber));
  }

  onAgreeTerms(bool? hasAgreed) {
    bloc.add(SignUpAgreedToTermsChangedEvent(hasAgreed!));
  }

  onTermsAndConditions() {
    //TODO navigate to terms and conditions page
  }

  onPrivacyPolicy() {
    //TODO navigate to terms and conditions page
  }

  onGenerateOTP() {

  }

  onOTP(String oTP) {
    bloc.add(SignUpUserEnteredOTPChangedEvent(oTP));
  }

  onResendOTP() {

  }

  onSubmitOTP() {

  }

  onSecondStepComplete() {
    if (bloc.state.userType != -1) {
      if (bloc.state.otherUserType.isLeft()) {
        toastInformation("Please provide user type");
      } else {
        bloc.add(SignUpActiveIndexChangedEvent(2));
      }
    } else {
      toastInformation("Please select user type first");
    }
  }

  onThirdStepComplete() {
    if (bloc.state.yarnCategorySelected.length == 0) {
      toastInformation("Please select at least one category");
    } else {
      bloc.add(SignUpActiveIndexChangedEvent(3));
    }
  }

  onFourthStepComplete() {
    if (bloc.state.yarnCategorySelected.length == 0) {
      toastInformation("Please select at least one category");
    } else {
      bloc.add(SignUpActiveIndexChangedEvent(3));
    }
  }

  onUserType(int buttonIndex) {
    bloc.add(SignUpUserTypeChangedEvent(buttonIndex.getUserType));
  }

  onOtherUserType(String otherUserType) {
    bloc.add(SignUpOtherUserTypeChangedEvent(otherUserType));
  }

  onYarnCategory(int categoryIndex, bool isElevated) {
    bloc.add(SignUpSelectedCategoryChangedEvent(
        (bloc.state.yarnCategorySelected as List).change(categoryIndex, isElevated)));
  }

  onFirstName(String firstName) {
    bloc.add(SignUpFirstNameChangedEvent(firstName));
  }

  onLastName(String lastName) {
    bloc.add(SignUpFirstNameChangedEvent(lastName));
  }

  onCompanyName(String companyName) {
    bloc.add(SignUpCompanyNameChangedEvent(companyName));
  }

  onPassword(String password) {
    bloc.add(SignUpPasswordChangedEvent(password));
  }

  List<String> get onYarnCategories {
    return YarnCategories.values.map((e) => e.getString()).toList();
  }
}
