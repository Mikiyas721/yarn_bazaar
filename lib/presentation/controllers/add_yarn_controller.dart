import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/application/add_yarn_requirement/add_yarn_requirement_bloc.dart';
import 'package:yarn_bazaar/presentation/models/add_yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class AddYarnController extends BlocViewModelController<
    AddYarnRequirementBloc,
    AddYarnRequirementEvent,
    AddYarnRequirementState,
    AddYarnRequirementViewModel> with ShortMessageMixin {
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

  onSelectColorTap() async {
    final options = [
      "Griege",
      "White / Bleach White",
      "Black",
      "Dop Dyed",
      "Yarn Dyed",
      "Red",
      "Space Dyed",
      "Melange",
      "RFD",
      "R.Blue",
      "N.Blue",
      "Maroon"
    ];
    final selectedColor = await Navigator.pushNamed(context, '/inputSelectionPage',
        arguments: OptionsWithNavigationModel(
            title: "Select Colour",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.color)));
    if (selectedColor != null) {
      bloc.add(AddYarnRequirementColorChangedEvent(selectedColor as String));
    } else
      toastInformation("Colour Not selected");
  }

  onQuantityChanged(String quantity) {
    bloc.add(AddYarnRequirementQuantityInKgsChangedEvent(quantity));
  }

  onDeliveryAreaChanged(String deliveryArea) {
    bloc.add(AddYarnRequirementDeliveryAreaChangedEvent(deliveryArea));
  }

  onDeliveryPeriod() async {
    final options = [
      "Ready",
      "2-3 days",
      "1 week",
      "up to 10 days",
      "up to 15 days",
      "15+ days"
    ];
    final deliveryPeriod = await Navigator.pushNamed(context, '/inputSelectionPage',
        arguments: OptionsWithNavigationModel(
            title: "Select Delivery Period",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.deliveryPeriod)));
    if (deliveryPeriod != null) {
      bloc.add(AddYarnRequirementDeliveryPeriodChangedEvent(deliveryPeriod as String));
    } else
      toastInformation("Delivery Period Not selected");
  }

  onPaymentTermsChanged(String paymentTerms) {
    bloc.add(AddYarnRequirementPaymentTermsChangedEvent(paymentTerms));
  }

  onInquiryClosesWithIn() {}

  onSendRequirementTo() async {
    final options = ["All Sellers", "Mills only", "Traders only"];
    final deliveryPeriod = await Navigator.pushNamed(context, '/inputSelectionPage',
        arguments: OptionsWithNavigationModel(
            title: "Send Requirements to",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.sendRequirementTo)));
    if (deliveryPeriod != null) {
      bloc.add(AddYarnRequirementDeliveryPeriodChangedEvent(deliveryPeriod as String));
    } else
      toastInformation("Send Requirement to not selected");
  }

  onAdditionalCommentsChanged(String additionalComment) {
    bloc.add(AddYarnRequirementAdditionalCommentChangedEvent(additionalComment));
  }

  onWantToTestReport(int radioIndex) {
    bloc.add(AddYarnRequirementWantToTestReportChangedEvent(radioIndex == 0 ? true : false));
  }

  onPreview() {
    final splitYarnQuality = currentState.yarnQuality.split(' ');
    final signedInUser = getIt.get<SplashBloc>().state.appUser;
    signedInUser.fold(() {
      toastError("Operation failed: Signed user not found");
    }, (a) {
      final yarnToPost = Yarn.createFromInput(
        intention: currentState.intention.getString(),
        count: splitYarnQuality[0],
        yarnType: splitYarnQuality[1],
        purpose: splitYarnQuality[2],
        qualityDetails: currentState.qualityDetails,
        colour: currentState.color,
        quantityInKgs: currentState.quantityInKgs.fold((l) => null, (r) => r.value.toString()),
        deliveryArea: currentState.deliveryArea.fold((l) => null, (r) => r.value),
        deliveryPeriod: currentState.deliveryPeriod,
        paymentTerms: currentState.paymentTerms.fold((l) => null, (r) => r.value),
        inquiryClosesWithIn: currentState.inquiryClosesWithin,
        sendRequirementTo: currentState.sendRequirementTo,
        additionalComments: currentState.additionalComment,
        userId: a.id,
      );
      yarnToPost.fold(() {
        toastError("Please enter all required fields");
      }, (a) {
        Navigator.pushNamed(context, '/composedYarnPage', arguments: a);
      });
    });
  }
}
