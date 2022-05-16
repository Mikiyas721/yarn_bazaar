import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/edit_bank_details_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/edit_bank_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_bank_details_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBankDetailsPage extends StatelessWidget {
  const EditBankDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<EditBankDetailViewModel, EditBankDetailsController>(
        create: () => EditBankDetailsController(context),
        onInit: (controller) => controller.loadSavedBankDetails(),
        builder: (context, controller, bankDetailViewModel) {
          return Scaffold(
              appBar: AppBar(
                leading: const PopButton(),
                title: const Text('Edit Bank Detail'),
              ),
              body: EditBankDetailsView(
                editBankDetailViewModel: bankDetailViewModel!,
                onAccountName: controller.onAccountName,
                onAccountNumber: controller.onAccountNumber,
                onIFSCCode: controller.onIFSCCode,
                onBankName: controller.onBankName,
                onBankBranch: controller.onBankBranch,
                onBankState: controller.onBankState,
                onBankCity: controller.onBankCity,
                onAttachAddress: controller.onAttachAddress,
                onAttachCheque: controller.onAttachCheque,
                onSave: controller.onSave,
                onReload: controller.loadSavedBankDetails,
                accountNameController: controller.accountNameController,
                accountNumberController: controller.accountNumberController,
                iFSCCodeController: controller.iFSCCodeController,
                bankNameController: controller.bankNameController,
                bankBranchController: controller.bankBranchController,
                bankStateController: controller.bankStateController,
                bankCityController: controller.bankCityController,
              ));
        });
  }
}
