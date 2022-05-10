import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/edit_business_details_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_business_detail_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBusinessDetailPage extends StatelessWidget {
  const EditBusinessDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<EditBusinessDetailViewModel,
            EditBusinessDetailsController>(
        create: () => EditBusinessDetailsController(context),
        onInit: (controller)=>controller.loadSaved(),
        builder: (context, controller, editBusinessDetailsViewModel) {
          return Scaffold(
              appBar: AppBar(
                leading: const PopButton(),
                title: const Text('Edit Business Details'),
              ),
              body: EditBusinessDetailView(
                editBusinessDetailViewModel: editBusinessDetailsViewModel!,
                onCompanyName: controller.onCompanyName,
                onAccountType: controller.onAccountType,
                onAddress: controller.onAddress,
                onCompleteAddress: controller.onCompleteAddress,
                onGSTNo: controller.onGSTNo,
                onTANNo: controller.onTANNo,
                onGSTDocument: controller.onGSTDocument,
                onPANNo: controller.onPANNo,
                onPANCardDocument: controller.onPANCardDocument,
                onSave: controller.onSave,
              ));
        });
  }
}
