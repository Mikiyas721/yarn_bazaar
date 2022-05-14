import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/presentation/controllers/composed_yarn_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ComposedYarnPage extends StatelessWidget {
  const ComposedYarnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as Yarn?;

    return argument == null
        ? Scaffold(body: Center(child: Text("Yarn missing")))
        : ControllerProvider<ComposedYarnController>(
            create: () => ComposedYarnController(context, argument),
            onInit: (controller) => controller.fillTextFields(),
            builder: (BuildContext context, ComposedYarnController composedYarnController) {
              return Scaffold(
                appBar: AppBar(
                  leading: const PopButton(),
                  title: const Text('Post Yarn Requirement'),
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 55),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                                child: Column(
                                  children: [
                                    10.vSpace,
                                    TextFieldWithTitle(
                                      title: 'Quality Details',
                                      controller: composedYarnController
                                          .qualityDetailsTextEditingController,
                                      fieldIsOptional: true,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Colour',
                                      controller:
                                          composedYarnController.colourTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Quantity (in kgs)',
                                      controller: composedYarnController
                                          .quantityInKgsTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Delivery Area',
                                      controller: composedYarnController
                                          .deliveryAreaTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Delivery Period',
                                      controller: composedYarnController
                                          .deliveryPeriodTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Payment Terms',
                                      controller: composedYarnController
                                          .paymentTermsTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Inquiry Closes Within',
                                      controller: composedYarnController
                                          .inquiryClosesWithInTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Send Requirement to',
                                      controller: composedYarnController
                                          .sendRequirementToTextEditingController,
                                      fieldIsOptional: false,
                                      readOnly: true,
                                      enabled: false,
                                    ),
                                    TextFieldWithTitle(
                                      title: 'Additional Comments',
                                      controller: composedYarnController
                                          .additionalCommentsTextEditingController,
                                      fieldIsOptional: true,
                                      readOnly: true,
                                      enabled: false,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: MyActionButton(
                        label: 'POST YARN REQUIREMENT',
                        onSubmit: () {
                          composedYarnController.onPostYarn();
                        },
                      ),
                    )
                  ],
                ),
              );
            });
  }
}
