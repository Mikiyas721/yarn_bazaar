import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/add_yarn_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/add_yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/presentation/views/add_yarn_requirement_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class AddYarnRequirementPage extends StatelessWidget {
  const AddYarnRequirementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<AddYarnRequirementViewModel, AddYarnController>(
      create: () => AddYarnController(context),
      builder: (context, controller, addYarnRequirementViewModel) {
        return Scaffold(
            appBar: AppBar(
              leading: const PopButton(),
              title: const Text('Post Yarn Requirement'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.phone_outlined),
                  onPressed: controller.onCall,
                )
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, bottom: 55),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AddYarnRequirementView(
                      yarnRequirementViewModel: addYarnRequirementViewModel!,
                      onInquiryOrPurchase: controller.onInquiryOrPurchase,
                      onYarnQualityTap: controller.onYarnQualityTap,
                      onQualityDetail: controller.onQualityDetail,
                      onSelectColorTap: controller.onSelectColorTap,
                      onQuantityChanged: controller.onQuantityChanged,
                      onDeliveryAreaChanged: controller.onDeliveryAreaChanged,
                      onDeliveryPeriod: controller.onDeliveryPeriod,
                      onPaymentTermsChanged: controller.onPaymentTermsChanged,
                      onInquiryClosesWithIn: controller.onInquiryClosesWithIn,
                      onSendRequirementTo: controller.onSendRequirementTo,
                      onAdditionalCommentsChanged: controller.onAdditionalCommentsChanged,
                      yarnQualityTextEditingController:
                          controller.yarnQualityTextEditingController,
                      colourTextEditingController: controller.colourTextEditingController,
                      deliveryPeriodTextEditingController:
                          controller.deliveryPeriodTextEditingController,
                      inquiryClosesWithinTextEditingController:
                          controller.inquiryClosesWithinTextEditingController,
                      sendRequirementToTextEditingController:
                          controller.sendRequirementToTextEditingController,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MyActionButton(
                      label: 'PREVIEW',
                      onSubmit: controller.onPreview,
                    ))
              ],
            ));
      },
    );
  }
}
