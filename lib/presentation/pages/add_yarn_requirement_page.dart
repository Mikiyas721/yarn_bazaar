import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/presentation/views/add_yarn_requirement_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class AddYarnRequirementPage extends StatelessWidget {
  const AddYarnRequirementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Post Yarn Requirement'),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AddYarnRequirementView(
              yarnRequirementViewModel: YarnRequirementViewModel.defaults(),
              onInquiryOrPurchase: (int buttonIndex) {},
              onQualityDetail: (String quality) {},
              onSelectColorTap: () {},
              onQuantityChanged: (String quality) {},
              onDeliveryAreaChanged: (String quality) {},
              onDeliveryPeriod: () {},
              onPaymentTermsChanged: (String quality) {},
              onInquiryClosesWithIn: () {},
              onSendRequirementTo: () {},
              onAdditionalCommentsChanged: (String quality) {},
              onWantToTestReport: (int radioIndex) {},
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ElevatedButton(
                child: const Text('PREVIEW'),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
