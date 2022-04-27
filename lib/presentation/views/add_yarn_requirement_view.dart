import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/inline_elevated_button.dart';
import 'package:yarn_bazaar/presentation/widgets/textfield_with_title.dart';
import 'package:yarn_bazaar/common/extensions.dart';

class AddYarnRequirementView extends StatelessWidget with DateTimeMixin {
  final YarnRequirementViewModel yarnRequirementViewModel;
  final Function(int buttonIndex) onInquiryOrPurchase;
  final Function(String qualityDetail) onQualityDetail;
  final VoidCallback onSelectColorTap;
  final Function(String qualityDetail) onQuantityChanged;
  final Function(String qualityDetail) onDeliveryAreaChanged;
  final VoidCallback onDeliveryPeriod;
  final Function(String qualityDetail) onPaymentTermsChanged;
  final VoidCallback onInquiryClosesWithIn;
  final VoidCallback onSendRequirementTo;
  final Function(String qualityDetail) onAdditionalCommentsChanged;
  final Function(int radioIndex) onWantToTestReport;

  const AddYarnRequirementView({
    Key? key,
    required this.yarnRequirementViewModel,
    required this.onInquiryOrPurchase,
    required this.onQualityDetail,
    required this.onSelectColorTap,
    required this.onQuantityChanged,
    required this.onDeliveryAreaChanged,
    required this.onDeliveryPeriod,
    required this.onPaymentTermsChanged,
    required this.onInquiryClosesWithIn,
    required this.onSendRequirementTo,
    required this.onAdditionalCommentsChanged,
    required this.onWantToTestReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              InlineElevatedButton(
                label: 'Price Inquiry',
                isElevated: yarnRequirementViewModel.intention ==
                    YarnRequirementIntention.priceInquiry,
                onClick: (bool isElevated) {
                  if (!isElevated) onInquiryOrPurchase(0);
                },
              ),
              InlineElevatedButton(
                label: 'Purchase',
                isElevated: yarnRequirementViewModel.intention ==
                    YarnRequirementIntention.purchase,
                onClick: (bool isElevated) {
                  if (!isElevated) onInquiryOrPurchase(1);
                },
              )
            ],
          ),
          Card(
            child: Column(
              children: [
                TextFieldWithTitle(
                  title: 'Quality Details',
                  textFieldValue: yarnRequirementViewModel.qualityDetails,
                  errorMessage: yarnRequirementViewModel.qualityDetailsError,
                  fieldIsOptional: true,
                  label: 'Enter tech specs. ex - combed, 2600 CSP etc',
                  onChanged: onQualityDetail,
                ),
                TextFieldWithTitle(
                  title: 'Colour',
                  textFieldValue: yarnRequirementViewModel.color,
                  fieldIsOptional: false,
                  readOnly: true,
                  label: 'Select Colour',
                  onTap: onSelectColorTap,
                  suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                TextFieldWithTitle(
                  title: 'Quantity (in kgs)',
                  textFieldValue: yarnRequirementViewModel.quantityInKgs,
                  errorMessage: yarnRequirementViewModel.quantityInKgsError,
                  fieldIsOptional: false,
                  label: 'Enter quantity ex - 1000 kgs',
                  onChanged: onQuantityChanged,
                ),
                TextFieldWithTitle(
                  title: 'Delivery Area',
                  textFieldValue: yarnRequirementViewModel.deliveryArea,
                  errorMessage: yarnRequirementViewModel.deliveryAreaError,
                  fieldIsOptional: false,
                  label: 'Enter ship to area. ex - Sonale, bhiwandi',
                  onChanged: onDeliveryAreaChanged,
                ),
                TextFieldWithTitle(
                  title: 'Delivery Period',
                  textFieldValue: yarnRequirementViewModel.deliveryPeriod,
                  fieldIsOptional: false,
                  readOnly: true,
                  label: 'ex - ready or within 1 week',
                  onTap: onDeliveryPeriod,
                  suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                TextFieldWithTitle(
                  title: 'Payment Terms',
                  textFieldValue: yarnRequirementViewModel.paymentTerms,
                  errorMessage: yarnRequirementViewModel.paymentTermsError,
                  fieldIsOptional: false,
                  label: 'ex - within 15 days',
                  onChanged: onPaymentTermsChanged,
                ),
                TextFieldWithTitle(
                  title: 'Inquiry Closes Within',
                  textFieldValue: getTimeString(
                      yarnRequirementViewModel.inquiryClosesWithin),
                  fieldIsOptional: false,
                  readOnly: true,
                  label: '03:00:00',
                  onTap: onInquiryClosesWithIn,
                  suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                TextFieldWithTitle(
                  title: 'Send Requirement to',
                  textFieldValue: yarnRequirementViewModel.sendRequirementTo,
                  fieldIsOptional: false,
                  readOnly: true,
                  label: 'All Sellers',
                  onTap: onSendRequirementTo,
                  suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                TextFieldWithTitle(
                  title: 'Additional Comments',
                  textFieldValue: yarnRequirementViewModel.additionalComment,
                  errorMessage: yarnRequirementViewModel.additionalCommentError,
                  fieldIsOptional: true,
                  label: 'ex - I want lowest price',
                  onChanged: onAdditionalCommentsChanged,
                ),
                RichText(
                    text: const TextSpan(children: [
                      TextSpan(text: 'I Want Test Report'),
                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                    ])),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                            value: yarnRequirementViewModel.wantToTestReport,
                            groupValue:
                            yarnRequirementViewModel.wantToTestReport,
                            onChanged: (bool? isSelected) {
                              onWantToTestReport(0);
                            }),
                        Text(
                          'Yes',
                          style: TextStyle(
                              color: yarnRequirementViewModel.wantToTestReport
                                  ? Colors.black
                                  : context.primaryColor),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                            value: !yarnRequirementViewModel.wantToTestReport,
                            groupValue:
                            yarnRequirementViewModel.wantToTestReport,
                            onChanged: (bool? isSelected) {
                              onWantToTestReport(1);
                            }),
                        Text(
                          'No',
                          style: TextStyle(
                              color: yarnRequirementViewModel.wantToTestReport
                                  ? Colors.black
                                  : context.primaryColor),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}