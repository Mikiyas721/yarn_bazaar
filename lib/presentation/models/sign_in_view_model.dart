import 'package:yarn_bazaar/presentation/models/view_model.dart';

class SignInViewModel extends ViewModel {
  final String phoneNumberOrEmail;
  final String? phoneNumberOrEmailError;
  final String password;
  final String? passwordError;
  final bool isShowingPassword;
  final bool hasSubmittedCredentials;
  final bool isVerifyingCredentials;

  SignInViewModel({
    required this.phoneNumberOrEmail,
    required this.phoneNumberOrEmailError,
    required this.password,
    required this.passwordError,
    required this.isShowingPassword,
    required this.hasSubmittedCredentials,
    required this.isVerifyingCredentials,
  });

  @override
  List<Object?> get props => [
        phoneNumberOrEmail,
        phoneNumberOrEmailError,
        password,
        passwordError,
        isShowingPassword,
        hasSubmittedCredentials,
        isVerifyingCredentials
      ];

  //TODO remove after other layers have been setup
  factory SignInViewModel.defaults() {
    return SignInViewModel(
      phoneNumberOrEmail: '',
      phoneNumberOrEmailError: null,
      password: '',
      passwordError: null,
      isShowingPassword: false,
      hasSubmittedCredentials: false,
      isVerifyingCredentials: false,
    );
  }
}
