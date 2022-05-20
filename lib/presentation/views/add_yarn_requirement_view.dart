import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';
import 'package:yarn_bazaar/presentation/models/add_yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/choice_button.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class AddYarnRequirementView extends StatelessWidget with DateTimeMixin {
  final AddYarnRequirementViewModel yarnRequirementViewModel;
  final Function(int buttonIndex) onInquiryOrPurchase;
  final VoidCallback onYarnQualityTap;
  final Function(String qualityDetail) onQualityDetail;
  final VoidCallback onSelectColorTap;
  final Function(String qualityDetail) onQuantityChanged;
  final Function(String qualityDetail) onDeliveryAreaChanged;
  final VoidCallback onDeliveryPeriod;
  final Function(String qualityDetail) onPaymentTermsChanged;
  final Function(String closesInMinutes) onInquiryClosesWithIn;
  final VoidCallback onSendRequirementTo;
  final Function(String qualityDetail) onAdditionalCommentsChanged;
  final TextEditingController? yarnQualityTextEditingController;
  final TextEditingController? colourTextEditingController;
  final TextEditingController? deliveryPeriodTextEditingController;
  final TextEditingController? inquiryClosesWithinTextEditingController;
  final TextEditingController? sendRequirementToTextEditingController;

  const AddYarnRequirementView({
    Key? key,
    required this.yarnRequirementViewModel,
    required this.onInquiryOrPurchase,
    required this.onYarnQualityTap,
    required this.onQualityDetail,
    required this.onSelectColorTap,
    required this.onQuantityChanged,
    required this.onDeliveryAreaChanged,
    required this.onDeliveryPeriod,
    required this.onPaymentTermsChanged,
    required this.onInquiryClosesWithIn,
    required this.onSendRequirementTo,
    required this.onAdditionalCommentsChanged,
    this.yarnQualityTextEditingController,
    this.colourTextEditingController,
    this.deliveryPeriodTextEditingController,
    this.inquiryClosesWithinTextEditingController,
    this.sendRequirementToTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChoiceButton(
                  label: 'Price Inquiry',
                  hasMaxWidth: false,
                  elevates: true,
                  isSelected: yarnRequirementViewModel.intention ==
                      YarnRequirementIntention.PriceInquiry,
                  onClick: (bool isSelected) {
                    if (isSelected) onInquiryOrPurchase(0);
                  },
                ),
              ),
              10.hSpace,
              Expanded(
                flex: 1,
                child: ChoiceButton(
                  label: 'Purchase',
                  hasMaxWidth: false,
                  elevates: true,
                  isSelected:
                      yarnRequirementViewModel.intention == YarnRequirementIntention.Purchase,
                  onClick: (bool isSelected) {
                    if (isSelected) onInquiryOrPurchase(1);
                  },
                ),
              )
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFieldWithTitle(
                    title: 'Yarn Quality',
                    errorMessage: yarnRequirementViewModel.yarnQualityError,
                    controller: yarnQualityTextEditingController,
                    fieldIsOptional: false,
                    readOnly: true,
                    hintText: '30s cotton',
                    onTap: onYarnQualityTap,
                    suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  TextFieldWithTitle(
                    title: 'Quality Details',
                    fieldIsOptional: true,
                    hintText: 'Enter tech specs. ex - combed, 2600 CSP etc',
                    onChanged: onQualityDetail,
                  ),
                  TextFieldWithTitle(
                    title: 'Colour',
                    errorMessage: yarnRequirementViewModel.colorError,
                    controller: colourTextEditingController,
                    fieldIsOptional: false,
                    readOnly: true,
                    hintText: 'Select Colour',
                    onTap: onSelectColorTap,
                    suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  TextFieldWithTitle(
                    title: 'Quantity (in kgs)',
                    errorMessage: yarnRequirementViewModel.quantityInKgsError,
                    fieldIsOptional: false,
                    hintText: 'Enter quantity ex - 1000 kgs',
                    onChanged: onQuantityChanged,
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWithTitle(
                    title: 'Delivery Area',
                    errorMessage: yarnRequirementViewModel.deliveryAreaError,
                    fieldIsOptional: false,
                    hintText: 'Enter ship to area. ex - Sonale, bhiwandi',
                    onChanged: onDeliveryAreaChanged,
                  ),
                  TextFieldWithTitle(
                    title: 'Delivery Period',
                    errorMessage: yarnRequirementViewModel.deliveryPeriodError,
                    controller: deliveryPeriodTextEditingController,
                    fieldIsOptional: false,
                    readOnly: true,
                    hintText: 'ex - ready or within 1 week',
                    onTap: onDeliveryPeriod,
                    suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  TextFieldWithTitle(
                    title: 'Payment Terms',
                    errorMessage: yarnRequirementViewModel.paymentTermsError,
                    fieldIsOptional: false,
                    hintText: 'ex - within 15 days',
                    onChanged: onPaymentTermsChanged,
                  ),
                  TextFieldWithTitle(
                    title: 'Inquiry Closes Within',
                    errorMessage: yarnRequirementViewModel.inquiryClosesWithinError,
                    controller: inquiryClosesWithinTextEditingController,
                    fieldIsOptional: false,
                    hintText: '1440',
                    onChanged: onInquiryClosesWithIn,
                    suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWithTitle(
                    title: 'Send Requirement to',
                    errorMessage: yarnRequirementViewModel.sendRequirementToError,
                    controller: sendRequirementToTextEditingController,
                    fieldIsOptional: false,
                    readOnly: true,
                    hintText: 'All Sellers',
                    onTap: onSendRequirementTo,
                    suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  TextFieldWithTitle(
                    title: 'Additional Comments',
                    fieldIsOptional: true,
                    hintText: 'ex - I want lowest price',
                    onChanged: onAdditionalCommentsChanged,
                  ),
                  50.vSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
