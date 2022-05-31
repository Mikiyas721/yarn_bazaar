import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/forgot_password_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/forgot_password_view_model.dart';
import 'package:yarn_bazaar/presentation/views/forgot_password_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const route = '/forgotPasswordPage';
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<ForgotPasswordViewModel,
            ForgotPasswordController>(
        create: () => ForgotPasswordController(context),
        builder: (context, controller, viewModel) {
          return Scaffold(
            appBar: AppBar(
              leading: PopButton(onPop: controller.onPop),
              elevation: 0,
            ),
            body: ForgotPasswordView(
              forgotPasswordViewModel: viewModel!,
              onPhoneNumber: controller.onPhoneNumber,
              onOTP: controller.onOTP,
              onSendOTP: controller.onSendOTP,
              onResendOTP: controller.onResendOTP,
              onVerifyOTP: controller.onVerifyOTP,
            ),
          );
        });
  }
}
