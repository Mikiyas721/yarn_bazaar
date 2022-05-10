import 'package:yarn_bazaar/common/view_model.dart';

class SignInViewModel extends ViewModel {
  final String? phoneNumber;
  final String? phoneNumberError;
  final String? password;
  final String? passwordError;
  final bool isShowingPassword;
  final bool isVerifyingCredentials;

  SignInViewModel({
    required this.phoneNumber,
    required this.phoneNumberError,
    required this.password,
    required this.passwordError,
    required this.isShowingPassword,
    required this.isVerifyingCredentials,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        phoneNumberError,
        password,
        passwordError,
        isShowingPassword,
        isVerifyingCredentials
      ];
}
