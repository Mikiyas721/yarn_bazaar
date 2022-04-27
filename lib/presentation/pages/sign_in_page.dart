import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';
import 'package:yarn_bazaar/presentation/views/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SignInView(
              signInViewModel: SignInViewModel.defaults(),
              onPhoneNumberOrEmail: (String phone) {},
              onPassword: (String password) {},
              onShowHidePassword: (bool isShowing) {},
              onForgotPassword: () {},
              onLogin: () {}),
          const Text("Don't have an account?"),
          Row(
            children: [
              const Text('Click'),
              TextButton(onPressed: () {}, child: const Text('here')),
              const Text('to register')
            ],
          )
        ],
      ),
    );
  }
}
