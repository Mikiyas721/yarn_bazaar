part of 'sign_in_bloc.dart';

@freezed
abstract class SignInState extends BlocState with _$SignInState {
  const factory SignInState({
    required Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
    required Either<PasswordFailure, Password> password,
    required bool showPassword,
    required bool isShowingPassword,
    required bool hasSubmittedCredentials,
    required bool isVerifyingCredentials,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        phoneNumber: PhoneNumber.create(''),
        password: Password.create(''),
        showPassword: false,
        isShowingPassword: false,
        hasSubmittedCredentials: false,
        isVerifyingCredentials: false,
      );
}
