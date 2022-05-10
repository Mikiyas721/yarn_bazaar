import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ComposedYarnView extends StatelessWidget {
  final ComposedYarnViewModel composedYarnViewModel;

  const ComposedYarnView({
    Key? key,
    required this.composedYarnViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Column(
              children: [
                10.vSpace,
                TextFieldWithTitle(
                  title: 'Quality Details',
                  textFieldValue: composedYarnViewModel.qualityDetails,
                  fieldIsOptional: true,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Colour',
                  textFieldValue: composedYarnViewModel.color,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Quantity (in kgs)',
                  textFieldValue: composedYarnViewModel.quantityInKgs,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Delivery Area',
                  textFieldValue: composedYarnViewModel.deliveryArea,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Delivery Period',
                  textFieldValue: composedYarnViewModel.deliveryPeriod,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Payment Terms',
                  textFieldValue: composedYarnViewModel.paymentTerms,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Inquiry Closes Within',
                  textFieldValue: composedYarnViewModel.inquiryClosesWithin,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Send Requirement to',
                  textFieldValue: composedYarnViewModel.sendRequirementTo,
                  fieldIsOptional: false,
                  readOnly: true,
                  enabled: false,
                ),
                TextFieldWithTitle(
                  title: 'Additional Comments',
                  textFieldValue: composedYarnViewModel.additionalComment,
                  fieldIsOptional: true,
                  readOnly: true,
                  enabled: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
