import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';

class AuthController extends ControllerWithOutBloc {
  AuthController(BuildContext context) : super(context);

  onSignIn() {
    Navigator.pushNamed(context, '/signInPage');
  }

  onSignUp() {
    Navigator.pushNamed(context, '/signUpPage');
  }
}
