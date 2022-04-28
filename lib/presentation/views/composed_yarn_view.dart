import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';

class ComposedYarnView extends StatelessWidget {
  final ComposedYarnViewModel composedYarnViewModel;

  const ComposedYarnView({
    Key? key,
    required this.composedYarnViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFieldWithTitle(
            title: 'Quality Details',
            textFieldValue: composedYarnViewModel.qualityDetails,
            fieldIsOptional: true,
          ),
          TextFieldWithTitle(
            title: 'Colour',
            textFieldValue: composedYarnViewModel.color,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Quantity (in kgs)',
            textFieldValue: composedYarnViewModel.quantityInKgs,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Delivery Area',
            textFieldValue: composedYarnViewModel.deliveryArea,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Delivery Period',
            textFieldValue: composedYarnViewModel.deliveryPeriod,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Payment Terms',
            textFieldValue: composedYarnViewModel.paymentTerms,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Inquiry Closes Within',
            textFieldValue: composedYarnViewModel.inquiryClosesWithin,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Send Requirement to',
            textFieldValue: composedYarnViewModel.sendRequirementTo,
            fieldIsOptional: false,
          ),
          TextFieldWithTitle(
            title: 'Additional Comments',
            textFieldValue: composedYarnViewModel.additionalComment,
            fieldIsOptional: true,
          )
        ],
      ),
    );
  }
}
