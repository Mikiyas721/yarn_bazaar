import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/pages/sign_in_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_up_page.dart';

class AuthController extends ControllerWithOutBloc {
  AuthController(BuildContext context) : super(context);

  onSignIn() {
    Navigator.pushNamed(context, SignInPage.route);
  }

  onSignUp() {
    Navigator.pushNamed(context, SignUpPage.route);
  }
}
