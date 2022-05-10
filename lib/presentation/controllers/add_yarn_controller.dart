import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/application/add_yarn_requirement/add_yarn_requirement_bloc.dart';
import 'package:yarn_bazaar/presentation/models/add_yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class AddYarnController extends BlocViewModelController<
    AddYarnRequirementBloc,
    AddYarnRequirementEvent,
    AddYarnRequirementState,
    AddYarnRequirementViewModel> with ToastMixin {
  AddYarnController(BuildContext context)
      : super(context, getIt.get<AddYarnRequirementBloc>(), true);

  @override
  AddYarnRequirementViewModel mapStateToViewModel(AddYarnRequirementState s) {
    return AddYarnRequirementViewModel(
      intention: s.intention,
      yarnQuality: s.yarnQuality,
      qualityDetails: s.qualityDetails,
      qualityDetailsError: null,
      color: s.color,
      quantityInKgs: s.quantityInKgs.fold((l) => null, (r) => r.value.toString()),
      quantityInKgsError:
          s.hasSubmitted ? s.quantityInKgs.fold((l) => l.message, (r) => null) : null,
      deliveryArea: s.deliveryArea.fold((l) => null, (r) => r.value),
      deliveryAreaError:
          s.hasSubmitted ? s.deliveryArea.fold((l) => l.message, (r) => null) : null,
      deliveryPeriod: s.deliveryPeriod,
      paymentTerms: s.paymentTerms.fold((l) => null, (r) => r.value),
      paymentTermsError:
          s.hasSubmitted ? s.paymentTerms.fold((l) => l.message, (r) => null) : null,
      inquiryClosesWithin: DateTime.parse(s.inquiryClosesWithin),
      sendRequirementTo: s.sendRequirementTo,
      additionalComment: s.additionalComment,
      additionalCommentError: null,
      wantToTestReport: s.wantToTestReport,
    );
  }

  onCall() {}

  onInquiryOrPurchase(int buttonIndex) {
    bloc.add(AddYarnRequirementIntentionChangedEvent(buttonIndex.getIntention));
  }

  onQualityDetail(String quality) {
    bloc.add(AddYarnRequirementYarnQualityDetailChangedEvent(quality));
  }

  onSelectColorTap() {}

  onQuantityChanged(String quantity) {
    bloc.add(AddYarnRequirementQuantityInKgsChangedEvent(quantity));
  }

  onDeliveryAreaChanged(String deliveryArea) {
    bloc.add(AddYarnRequirementDeliveryAreaChangedEvent(deliveryArea));
  }

  onDeliveryPeriod() {}

  onPaymentTermsChanged(String paymentTerms) {
    bloc.add(AddYarnRequirementPaymentTermsChangedEvent(paymentTerms));
  }

  onInquiryClosesWithIn() {}

  onSendRequirementTo() {}

  onAdditionalCommentsChanged(String additionalComment) {
    bloc.add(AddYarnRequirementAdditionalCommentChangedEvent(additionalComment));
  }

  onWantToTestReport(int radioIndex) {
    bloc.add(AddYarnRequirementWantToTestReportChangedEvent(radioIndex == 0 ? true : false));
  }

  onPreview() {
    Navigator.pushNamed(context, '/composedYarnPage');
  }
}
