import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/sign_up_controller.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/presentation/views/sign_up_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<SignUpViewModel, SignUpController>(
        create: () => SignUpController(context),
        builder: (context, controller, signUpViewModel) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white10,
              leading: PopButton(onPop: controller.onPop),
              title: Text(
                controller.getTitle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            body: SignUpView(
              signUpViewModel: signUpViewModel!,
              onPhoneNumber: controller.onPhoneNumber,
              onAgreeTerms: controller.onAgreeTerms,
              onTermsAndConditions: controller.onTermsAndConditions,
              onPrivacyPolicy: controller.onPrivacyPolicy,
              onGenerateOTP: controller.onGenerateOTP,
              onSecondStepComplete: controller.onSecondStepComplete,
              onThirdStepComplete: controller.onThirdStepComplete,
              onSignUp: controller.onSignUp,
              onOTP: controller.onOTP,
              onResendOTP: controller.onResendOTP,
              onSubmitOTP: controller.onVerifyOTP,
              onUserType: controller.onUserType,
              onOtherUserType: controller.onOtherUserType,
              onYarnCategory: controller.onYarnCategory,
              onFirstName: controller.onFirstName,
              onLastName: controller.onLastName,
              onCompanyName: controller.onCompanyName,
              onPassword: controller.onPassword,
              categories: controller.onYarnCategories,
            ),
          );
        });
  }
}
