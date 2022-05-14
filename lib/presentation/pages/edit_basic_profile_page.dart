import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/edit_basic_information_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/edit_basic_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_basic_profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBasicProfilePage extends StatelessWidget {
  const EditBasicProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<EditBasicProfileViewModel,
            EditBasicInformationController>(
        create: () => EditBasicInformationController(context),
        onInit: (controller)=>controller.loadSaved(),
        builder: (context, controller, viewModel) {
          return Scaffold(
            appBar: AppBar(
              leading: const PopButton(),
              title: const Text('Edit Basic Profile'),
            ),
            body: EditBasicProfileView(
              editBasicProfileViewModel: viewModel!,
              onFirstName: controller.onFirstName,
              onLastName: controller.onLastName,
              onInBusinessSince: controller.onInBusinessSince,
              onPhoneNumber: controller.onPhoneNumber,
              onCountry: controller.onCountry,
              onCity: controller.onCity,
              onEmail: controller.onEmail,
              onWebsite: controller.onWebsite,
              onSave: controller.onSave,
              onReload: controller.loadSaved(),
              firstNameTextEditingController:controller.firstNameTextEditingController,
              lastNameTextEditingController:controller.lastNameTextEditingController,
              inBusinessSinceTextEditingController:controller.inBusinessSinceTextEditingController,
              primaryNumberTextEditingController:controller.primaryNumberTextEditingController,
              countryTextEditingController:controller.countryTextEditingController,
              cityTextEditingController:controller.cityTextEditingController,
              emailTextEditingController:controller.emailTextEditingController,
              websiteTextEditingController:controller.websiteTextEditingController,
            ),
          );
        });
  }
}
