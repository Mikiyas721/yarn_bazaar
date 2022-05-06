part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState extends BlocState with _$SignUpState {
  const factory SignUpState({
    required int activeStepIndex,
    required Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
    required bool hasAgreedToTerms,
    required bool isGeneratingOTP,
    required bool hasGeneratedOTP,
    String? generatedOTP,
    required Either<VerificationCodeFailure, VerificationCode> userEnteredOTP,
    required Either<UserTypeFailure, UserType> userType,
    required Either<UserTypeFailure, UserType> otherUserType,
    required bool hasSubmittedUserType,
    required List<String> yarnCategorySelected,
    required Either<NameFailure, Name> firstName,
    required Either<NameFailure, Name> lastName,
    required Either<CompanyNameFailure, CompanyName> companyName,
    required Either<PasswordFailure, Password> password,
    required bool hasSubmittedUserInformation,
    required bool isAddingUser,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        activeStepIndex: 0,
        phoneNumber: PhoneNumber.create(''),
        hasAgreedToTerms: false,
        isGeneratingOTP: false,
        hasGeneratedOTP: false,
        generatedOTP: null,
        userEnteredOTP: VerificationCode.createFromString(''),
        userType: UserType.create(''),
        otherUserType: UserType.create(''),
        hasSubmittedUserType: false,
        yarnCategorySelected: const [],
        firstName: Name.create(''),
        lastName: Name.create(''),
        companyName: CompanyName.create(''),
        password: Password.create(''),
        hasSubmittedUserInformation: false,
        isAddingUser: false,
      );
}
