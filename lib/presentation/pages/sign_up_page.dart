import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/presentation/views/sign_up_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Enter Mobile Number'),
      ),
      body: SignUpView(
        signUpViewModel: SignUpViewModel.defaults(),
        onPhoneNumber: (String phoneNumber) {},
        onAgreeTerms: (bool? hasAgreed) {},
        onTermsAndConditions: () {},
        onPrivacyPolicy: () {},
        onGenerateOTP: () {},
        onSecondStep: () {},
        onThirdStep: () {},
        onFourthStep: () {},
        onOTP: (String oTP) {},
        onResendOTP: () {},
        onSubmitOTP: () {},
      ),
    );
  }
}
