import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel signInViewModel;
  final void Function(String phoneNumber) onPhoneNumber;
  final void Function(String onPassword) onPassword;
  final void Function(bool show) onShowHidePassword;
  final VoidCallback onForgotPassword;
  final VoidCallback onLogin;

  const SignInView({
    Key? key,
    required this.signInViewModel,
    required this.onPhoneNumber,
    required this.onPassword,
    required this.onShowHidePassword,
    required this.onForgotPassword,
    required this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text('Mobile Number'),
            Text('*', style: TextStyle(color: Colors.red))
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    enabled: false,
                    controller: TextEditingController(text: '+91'),
                  ),
                )),
            Expanded(
                flex: 9,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: signInViewModel.phoneNumberError,
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: onPhoneNumber,
                ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        TextFieldWithTitle(
          title: "Password",
          fieldIsOptional: false,
          obscureText: !signInViewModel.isShowingPassword,
          errorMessage: signInViewModel.passwordError,
          hintText: "Password",
          onChanged: onPassword,
          onSubmitted: (_) {
            onLogin();
          },
          suffixIcon: TextButton(
              onPressed: () {
                onShowHidePassword(!signInViewModel.isShowingPassword);
              },
              child: Text(signInViewModel.isShowingPassword ? 'Hide' : 'Show')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: onForgotPassword, child: const Text('Forgot password?'))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: MyActionButton(
            onSubmit: onLogin,
            label: 'LOGIN',
            isLoading: signInViewModel.isVerifyingCredentials,
          ),
        )
      ],
    );
  }
}
