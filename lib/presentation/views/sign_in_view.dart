import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel signInViewModel;
  final void Function(String phoneNumberOrEmail) onPhoneNumberOrEmail;
  final void Function(String onPassword) onPassword;
  final void Function(bool show) onShowHidePassword;
  final VoidCallback onForgotPassword;
  final VoidCallback onLogin;

  const SignInView({
    Key? key,
    required this.signInViewModel,
    required this.onPhoneNumberOrEmail,
    required this.onPassword,
    required this.onShowHidePassword,
    required this.onForgotPassword,
    required this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: const TextSpan(children: [
          TextSpan(text: 'Mobile Number or Email'),
          TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        ])),
        Row(
          children: [
            TextField(
                readOnly: true, controller: TextEditingController(text: '+91')),
            TextField(
              decoration: InputDecoration(
                  errorText: signInViewModel.phoneNumberOrEmailError,
                  labelText: 'Mobile Number or Email'),
              onChanged: onPhoneNumberOrEmail,
            )
          ],
        ),
        RichText(
            text: const TextSpan(children: [
          TextSpan(text: 'Password'),
          TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        ])),
        TextField(
          decoration: InputDecoration(
              errorText: signInViewModel.passwordError,
              labelText: 'Password',
              suffixIcon: TextButton(
                  onPressed: () {
                    onShowHidePassword(!signInViewModel.isShowingPassword);
                  },
                  child: Text(
                      signInViewModel.isShowingPassword ? 'Hide' : 'Show'))),
          onChanged: onPassword,
          onSubmitted: (_) {
            onLogin();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: onForgotPassword,
                child: const Text('Forgot password?'))
          ],
        ),
        ElevatedButton(onPressed: onLogin, child: const Text('LOGIN'))
      ],
    );
  }
}
