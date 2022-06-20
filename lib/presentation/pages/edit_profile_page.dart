import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/edit_profile_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/models/edit_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditProfilePage extends StatelessWidget {
  static const route = '/editProfilePage';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          elevation: 0,
          backgroundColor: context.primaryColor,
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ViewModelBuilder.withController<EditProfileViewModel, EditProfileController>(
            create: () => EditProfileController(context),
            builder: (context, controller, viewModel) {
              return EditProfileView(
                buyerProfileViewModel: viewModel!,
                onEditPicture: controller.onEditProfilePic,
                onBasicProfile: controller.onBasicProfile,
                onBusinessDetails: controller.onBusinessDetails,
                onBankDetails: controller.onBankDetails,
                onChangePassword: controller.onChangePassword,
              );
            }));
  }
}
