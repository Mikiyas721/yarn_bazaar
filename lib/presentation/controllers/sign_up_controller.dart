import 'package:flutter/material.dart';
import 'package:yarn_bazaar/application/sign_up/sign_up_bloc.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/use_cases/add_new_user.dart';
import 'package:yarn_bazaar/domain/use_cases/cache_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/check_phone_number.dart';
import 'package:yarn_bazaar/domain/use_cases/request_firebase_phone_auth_code.dart';
import 'package:yarn_bazaar/domain/use_cases/verify_firebase_phone_auth_code.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/infrastructure/repos/firebase_repo_impl.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/home_page.dart';
import 'package:yarn_bazaar/presentation/pages/privacy_policy_page.dart';
import 'package:yarn_bazaar/presentation/pages/terms_and_conditions_page.dart';

class SignUpController
    extends BlocViewModelController<SignUpBloc, SignUpEvent, SignUpState, SignUpViewModel>
    with ShortMessageMixin {
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
      isVerifyingOTP: s.isVerifyingOTP,
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

  onPop() async {
    if (!currentState.isGeneratingOTP && !currentState.hasGeneratedOTP) {
      Navigator.pop(context);
    } else {
      final confirmed = await showConfirmationDialog(context);
      if (confirmed) Navigator.pop(context);
    }
  }

  String getTitle() {
    if (currentState.activeStepIndex == 0 && !currentState.hasGeneratedOTP)
      return 'Enter Mobile Number';
    else if (currentState.activeStepIndex == 0 && currentState.hasGeneratedOTP)
      return 'Enter OTP';
    else if (currentState.activeStepIndex == 1)
      return 'Select user type';
    else if (currentState.activeStepIndex == 2)
      return 'Select yarn categories';
    else if (currentState.activeStepIndex == 3)
      return 'Enter user information';
    else
      return '';
  }

  onPhoneNumber(String phoneNumber) {
    bloc.add(SignUpPhoneNumberChangedEvent(phoneNumber));
  }

  onAgreeTerms(bool? hasAgreed) {
    if (!currentState.isGeneratingOTP && !currentState.hasGeneratedOTP)
      bloc.add(SignUpAgreedToTermsChangedEvent(hasAgreed!));
    else
      toastInformation("Action can not be completed because OTP generation started");
  }

  onTermsAndConditions() {
    Navigator.pushNamed(context, TermsAndConditionsPage.route);
  }

  onPrivacyPolicy() {
    Navigator.pushNamed(context, PrivacyPolicyPage.route);
  }

  onGenerateOTP() {
    bloc.add(SignUpSubmittedPhoneNumberEvent());
    currentState.phoneNumber.fold((l) {
      toastError(l.message);
    }, (r) async {
      bloc.add(SignUpStartedGeneratingOTPEvent());
      final apiAccountCheckResult = await getIt.get<CheckPhoneNumber>().execute(r);

      apiAccountCheckResult.fold((l) {
        bloc.add(SignUpStoppedGeneratingOTPEvent());
        toastError(l.message);
      }, (accountExists) async {
        if (accountExists) {
          bloc.add(SignUpStoppedGeneratingOTPEvent());
          toastError("Phone number already in use");
        } else {
          final firebaseAuthResult =
              await getIt.get<RequestFirebasePhoneAuthCode>().execute(r);

          bloc.add(SignUpStoppedGeneratingOTPEvent());
          if (firebaseAuthResult is PhoneAuthSuccessResult) {
            bloc.add(SignUpActiveIndexChangedEvent(1));
          } else if (firebaseAuthResult is PhoneAuthFailedResult) {
            toastError(firebaseAuthResult.failureMessage);
          } else if (firebaseAuthResult is PhoneAuthTimeoutResult) {
            bloc.add(SignUpGeneratedOTPEvent());
          }
        }
      });
    });
  }

  onVerifyOTP() async {
    bloc.add(SignUpStartedVerifyingOTPChangedEvent());
    bloc.state.userEnteredOTP.fold((l) {
      toastError(l.message);
      bloc.add(SignUpStoppedVerifyingOTPChangedEvent());
    }, (r) async {
      final verificationResult =
          await getIt.get<VerifyFirebasePhoneAuthCode>().execute(r.value.toString());
      verificationResult.fold((l) {
        bloc.add(SignUpStoppedVerifyingOTPChangedEvent());
        toastError(l.message);
      }, (r) {
        bloc.add(SignUpActiveIndexChangedEvent(1));
      });
    });
  }

  onOTP(String oTP) {
    bloc.add(SignUpUserEnteredOTPChangedEvent(oTP));
  }

  onResendOTP() {
    bloc.state.phoneNumber.fold((l) {
      toastError(l.message);
    }, (r) async {
      bloc.add(SignUpStartedGeneratingOTPEvent());
      final firebaseAuthResult = await getIt.get<RequestFirebasePhoneAuthCode>().execute(r);
      bloc.add(SignUpStoppedGeneratingOTPEvent());

      if (firebaseAuthResult is PhoneAuthSuccessResult) {
        bloc.add(SignUpActiveIndexChangedEvent(1));
      } else if (firebaseAuthResult is PhoneAuthFailedResult) {
        toastError(firebaseAuthResult.failureMessage);
      } else if (firebaseAuthResult is PhoneAuthTimeoutResult) {
        bloc.add(SignUpGeneratedOTPEvent());
      }
    });
  }

  onSecondStepComplete() {
    if (bloc.state.userType != -1) {
      if (bloc.state.userType == UserType.other && bloc.state.otherUserType.isLeft()) {
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

  onSignUp() {
    bloc.add(SignUpStartedAddingUserChangedEvent());
    bloc.add(SignUpSubmittedUserInformationEvent());
    final appUser = AppUser.createFromInput(
        firstName: currentState.firstName.fold((l) => null, (r) => r.value),
        lastName: currentState.lastName.fold((l) => null, (r) => r.value),
        phoneNumber: currentState.phoneNumber.fold((l) => null, (r) => r.value),
        companyName: currentState.companyName.fold((l) => null, (r) => r.value),
        accountType: currentState.userType.getString(),
        categories: currentState.yarnCategorySelected.getYarnCategories(),
        password: currentState.password.fold((l) => null, (r) => r.value));
    appUser.fold(() {
      toastError("Operation failed: Invalid Input(s)");
      bloc.add(SignUpStoppedAddingUserChangedEvent());
    }, (a) async {
      final result = await getIt.get<AddNewUser>().execute(a);
      result.fold((l) {
        toastError(l.message);
        bloc.add(SignUpStoppedAddingUserChangedEvent());
      }, (r) async {
        bloc.add(SignUpStoppedAddingUserChangedEvent());
        getIt.get<SplashBloc>().add(SplashAppUserChangedEvent(getOption(r)));
        final userWasCached = await getIt.get<CacheLoggedInUser>().execute(r);
        if (!userWasCached) toastInformation("Unable to cache user");

        Navigator.pushNamedAndRemoveUntil(context, HomePage.route, (route) => false);
      });
    });
  }

  onUserType(int buttonIndex) {
    bloc.add(SignUpUserTypeChangedEvent(buttonIndex.getUserType));
  }

  onOtherUserType(String otherUserType) {
    bloc.add(SignUpOtherUserTypeChangedEvent(otherUserType));
  }

  onYarnCategory(int categoryIndex, bool isSelected) {
    List<bool> updatedList = List.of(bloc.state.yarnCategorySelected);
    updatedList[categoryIndex] = isSelected;
    bloc.add(SignUpSelectedCategoryChangedEvent(updatedList));
  }

  onFirstName(String firstName) {
    bloc.add(SignUpFirstNameChangedEvent(firstName));
  }

  onLastName(String lastName) {
    bloc.add(SignUpLastNameChangedEvent(lastName));
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
