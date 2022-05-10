part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState extends BlocState with _$SignUpState {
  const factory SignUpState({
    required int activeStepIndex,
    required Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
    required bool hasSubmittedPhoneNumber,
    required bool hasAgreedToTerms,
    required bool isGeneratingOTP,
    required bool hasGeneratedOTP,
    String? generatedOTP,
    required Either<VerificationCodeFailure, VerificationCode> userEnteredOTP,
    required bool hasSubmittedOTP,
    required UserType userType,
    required Either<OtherUserTypeFailure, OtherUserType> otherUserType,
    required bool hasSubmittedUserType,
    required List<bool> yarnCategorySelected,
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
        hasSubmittedPhoneNumber: false,
        hasAgreedToTerms: false,
        isGeneratingOTP: false,
        hasGeneratedOTP: false,
        generatedOTP: null,
        userEnteredOTP: VerificationCode.createFromString(''),
        hasSubmittedOTP: false,
        userType: UserType.other,
        otherUserType: OtherUserType.create(''),
        hasSubmittedUserType: false,
        yarnCategorySelected: List.filled(12, false),
        firstName: Name.create(null),
        lastName: Name.create(null),
        companyName: CompanyName.create(''),
        password: Password.create(''),
        hasSubmittedUserInformation: false,
        isAddingUser: false,
      );
}
