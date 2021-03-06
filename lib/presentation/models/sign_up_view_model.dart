import 'package:yarn_bazaar/common/view_model.dart';

class SignUpViewModel extends ViewModel {
  final int activeStepIndex;
  final String? phoneNumber;
  final String? phoneNumberError;
  final bool hasAgreedToTerms;
  final bool isGeneratingOTP;
  final bool isVerifyingOTP;
  final bool hasGeneratedOTP;
  final String? oTP;
  final String? oTPError;
  final int? userTypeIndex;
  final String? otherUserType;
  final String? otherUserTypeError;
  final List<bool> yarnCategorySelected;
  final String? firstName;
  final String? firstNameError;
  final String? lastName;
  final String? lastNameError;
  final String? companyName;
  final String? companyNameError;
  final String? password;
  final String? passwordError;
  final bool isAddingUser;

  SignUpViewModel({
    required this.activeStepIndex,
    required this.phoneNumber,
    required this.phoneNumberError,
    required this.hasAgreedToTerms,
    required this.isGeneratingOTP,
    required this.hasGeneratedOTP,
    required this.isVerifyingOTP,
    required this.oTP,
    required this.oTPError,
    required this.userTypeIndex,
    required this.otherUserType,
    required this.otherUserTypeError,
    required this.yarnCategorySelected,
    required this.firstName,
    required this.firstNameError,
    required this.lastName,
    required this.lastNameError,
    required this.companyName,
    required this.companyNameError,
    required this.password,
    required this.passwordError,
    required this.isAddingUser,
  });

  @override
  List<Object?> get props => [
        activeStepIndex,
        phoneNumber,
        phoneNumberError,
        hasAgreedToTerms,
        isGeneratingOTP,
        hasGeneratedOTP,
        isVerifyingOTP,
        oTP,
        oTPError,
        userTypeIndex,
        otherUserType,
        otherUserTypeError,
        yarnCategorySelected,
        firstName,
        firstNameError,
        lastName,
        lastNameError,
        companyName,
        companyNameError,
        password,
        passwordError,
        isAddingUser,
      ];
}
