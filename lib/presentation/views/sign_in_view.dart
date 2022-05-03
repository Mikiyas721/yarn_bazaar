import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';

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
        Row(
          children: const [
            Text('Mobile Number or Email'),
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
                  decoration: InputDecoration(
                      errorText: signInViewModel.phoneNumberOrEmailError,
                      hintText: 'Mobile Number or Email'),
                  controller: TextEditingController(
                      text: signInViewModel.phoneNumberOrEmail),
                  onChanged: onPhoneNumberOrEmail,
                ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: const [
            Text('Password'),
            Text('*', style: TextStyle(color: Colors.red))
          ],
        ),
        //TODO use TextFieldWithTitle widget
        TextField(
          obscureText: signInViewModel.isShowingPassword,
          decoration: InputDecoration(
              errorText: signInViewModel.passwordError,
              hintText: 'Password',
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
