import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/application/add_yarn_requirement/add_yarn_requirement_bloc.dart';
import 'package:yarn_bazaar/presentation/models/add_yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/composed_yarn_page.dart';
import 'package:yarn_bazaar/presentation/pages/input_selection_page.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class AddYarnController extends BlocViewModelController<
    AddYarnRequirementBloc,
    AddYarnRequirementEvent,
    AddYarnRequirementState,
    AddYarnRequirementViewModel> with ShortMessageMixin {
  AddYarnController(BuildContext context)
      : super(context, getIt.get<AddYarnRequirementBloc>(), true);

  final yarnQualityTextEditingController = TextEditingController();
  final colourTextEditingController = TextEditingController();
  final deliveryPeriodTextEditingController = TextEditingController();
  final inquiryClosesWithinTextEditingController = TextEditingController();
  final sendRequirementToTextEditingController = TextEditingController();

  @override
  AddYarnRequirementViewModel mapStateToViewModel(AddYarnRequirementState s) {
    return AddYarnRequirementViewModel(
      intention: s.intention,
      yarnQualityError:
          s.hasSubmitted && s.yarnQuality == null ? "Yarn Quality is required" : null,
      colorError: s.hasSubmitted && s.color == null ? "Colour is required" : null,
      quantityInKgsError:
          s.hasSubmitted ? s.quantityInKgs.fold((l) => l.message, (r) => null) : null,
      deliveryAreaError:
          s.hasSubmitted ? s.deliveryArea.fold((l) => l.message, (r) => null) : null,
      deliveryPeriodError:
          s.hasSubmitted && s.deliveryPeriod == null ? "Delivery Period is required" : null,
      paymentTermsError:
          s.hasSubmitted ? s.paymentTerms.fold((l) => l.message, (r) => null) : null,
      inquiryClosesWithinError: s.hasSubmitted && s.inquiryClosesWithin == null
          ? "Inquiry closing duration is required"
          : null,
      sendRequirementToError: s.hasSubmitted && s.deliveryPeriod == null
          ? "Send requirement to is required"
          : null,
    );
  }

  onCall() {}

  onInquiryOrPurchase(int buttonIndex) {
    bloc.add(AddYarnRequirementIntentionChangedEvent(buttonIndex.getIntention));
  }

  onYarnQualityTap() async {
    final options = [
      "30s Fancy Cotton",
      "21s Cotton Hosiery",
      "40s Fancy Worsted Wool",
      "15s Fancy Linen"
    ];
    final selectedYarnQuality = await Navigator.pushNamed(context, InputSelectionPage.route,
        arguments: OptionsWithNavigationModel(
            title: "Select Yarn Quality",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.yarnQuality ?? "")));
    if (selectedYarnQuality != null) {
      bloc.add(AddYarnRequirementYarnQualityChangedEvent(selectedYarnQuality as String));
      yarnQualityTextEditingController.text = selectedYarnQuality;
    } else
      toastInformation("Yarn Quality selection discarded");
  }

  onQualityDetail(String quality) {
    bloc.add(AddYarnRequirementYarnQualityChangedEvent(quality));
  }

  onSelectColorTap() async {
    final selectedColor = await Navigator.pushNamed(context, InputSelectionPage.route,
        arguments: OptionsWithNavigationModel(
            title: "Select Colour",
            options: myYarnColors,
            isMultiSelect: false,
            selectedOptionIndex: myYarnColors.indexOf(currentState.color ?? "")));
    if (selectedColor != null) {
      bloc.add(AddYarnRequirementColorChangedEvent(selectedColor as String));
      colourTextEditingController.text = selectedColor;
    } else
      toastInformation("Colour selection discarded");
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
    final deliveryPeriod = await Navigator.pushNamed(context, InputSelectionPage.route,
        arguments: OptionsWithNavigationModel(
            title: "Select Delivery Period",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.deliveryPeriod ?? "")));
    if (deliveryPeriod != null) {
      bloc.add(AddYarnRequirementDeliveryPeriodChangedEvent(deliveryPeriod as String));
      deliveryPeriodTextEditingController.text = deliveryPeriod;
    } else
      toastInformation("Delivery Period selection discarded");
  }

  onPaymentTermsChanged(String paymentTerms) {
    bloc.add(AddYarnRequirementPaymentTermsChangedEvent(paymentTerms));
  }

  onInquiryClosesWithIn(String inquiryInMinutes) {
    bloc.add(
        AddYarnRequirementInquiryClosesWithinChangedEvent(int.tryParse(inquiryInMinutes)));
  }

  onSendRequirementTo() async {
    final options = ["All Sellers", "Mills only", "Traders only"];
    final sendRequirementTo = await Navigator.pushNamed(context, InputSelectionPage.route,
        arguments: OptionsWithNavigationModel(
            title: "Send Requirements to",
            options: options,
            isMultiSelect: false,
            selectedOptionIndex: options.indexOf(currentState.sendRequirementTo ?? "")));
    if (sendRequirementTo != null) {
      bloc.add(AddYarnRequirementSendRequirementToChangedEvent(sendRequirementTo as String));
      sendRequirementToTextEditingController.text = sendRequirementTo;
    } else
      toastInformation("Send Requirement to selection discarded");
  }

  onAdditionalCommentsChanged(String additionalComment) {
    bloc.add(AddYarnRequirementAdditionalCommentChangedEvent(additionalComment));
  }

  onPreview() {
    //TODO more on splitting yarn quality
    bloc.add(AddYarnRequirementSubmittedEvent());
    final splitYarnQuality = currentState.yarnQuality?.split(' ');
    final signedInUser = getIt.get<SplashBloc>().state.appUser;
    signedInUser.fold(() {
      toastError("Operation failed: Signed user not found");
    }, (a) {
      if (splitYarnQuality == null || splitYarnQuality.length < 3) {
        toastError("Please enter all required fields");
      } else {
        final yarnToPost = Yarn.createFromInput(
          intention: currentState.intention.getString(),
          count: splitYarnQuality[0],
          yarnType: splitYarnQuality[1],
          purpose: splitYarnQuality[2],
          qualityDetails: currentState.qualityDetails,
          colour: currentState.color,
          quantityInKgs:
              currentState.quantityInKgs.fold((l) => null, (r) => r.value.toString()),
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
          Navigator.pushNamed(context, ComposedYarnPage.route, arguments: a);
        });
      }
    });
  }
}
