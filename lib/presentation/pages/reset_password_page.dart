import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/reset_password_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/reset_password_view_model.dart';
import 'package:yarn_bazaar/presentation/views/reset_password_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class ResetPasswordPage extends StatelessWidget {
  static const route = '/resetPasswordPage';

  const ResetPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ModalRoute.of(context)?.settings.arguments as String?;

    return phoneNumber == null
        ? Scaffold(
            body: Center(child: Text("Phone number not provided")),
          )
        : ViewModelBuilder.withController<ResetPasswordViewModel, ResetPasswordController>(
            create: () => ResetPasswordController(context, phoneNumber),
            builder: (context, controller, viewModel) {
              return Scaffold(
                appBar: AppBar(
                  leading: const PopButton(),
                  title: const Text('Change Password'),
                ),
                body: ResetPasswordView(
                  resetPasswordViewModel: viewModel!,
                  onOldPassword: controller.onOldPassword,
                  onShowOldPassword: controller.onShowOldPassword,
                  onNewPassword: controller.onNewPassword,
                  onShowNewPassword: controller.onShowNewPassword,
                  onReset: controller.onSave,
                ),
              );
            });
  }
}
