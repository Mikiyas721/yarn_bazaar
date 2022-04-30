import 'package:yarn_bazaar/presentation/models/view_model.dart';

class YarnRequirementViewModel extends ViewModel {
  final YarnRequirementIntention intention;
  final String? yarnQuality;
  final String? qualityDetails;
  final String? qualityDetailsError;
  final String? color;
  final String? quantityInKgs;
  final String? quantityInKgsError;
  final String? deliveryArea;
  final String? deliveryAreaError;
  final String? deliveryPeriod;
  final String? paymentTerms;
  final String? paymentTermsError;
  final DateTime? inquiryClosesWithin;
  final String? sendRequirementTo;
  final String? additionalComment;
  final String? additionalCommentError;
  final bool wantToTestReport;

  YarnRequirementViewModel({
    required this.intention,
    required this.yarnQuality,
    required this.qualityDetails,
    required this.qualityDetailsError,
    required this.color,
    required this.quantityInKgs,
    required this.quantityInKgsError,
    required this.deliveryArea,
    required this.deliveryAreaError,
    required this.deliveryPeriod,
    required this.paymentTerms,
    required this.paymentTermsError,
    required this.inquiryClosesWithin,
    required this.sendRequirementTo,
    required this.additionalComment,
    required this.additionalCommentError,
    required this.wantToTestReport,
  });

  @override
  List<Object?> get props => [
        intention,
        yarnQuality,
        qualityDetails,
        qualityDetailsError,
        color,
        quantityInKgs,
        quantityInKgsError,
        deliveryArea,
        deliveryAreaError,
        deliveryPeriod,
        paymentTerms,
        paymentTermsError,
        inquiryClosesWithin,
        sendRequirementTo,
        additionalComment,
        additionalCommentError,
        wantToTestReport,
      ];

  //TODO remove after other layers have been setup
  factory YarnRequirementViewModel.defaults() {
    return YarnRequirementViewModel(
      intention: YarnRequirementIntention.none,
      yarnQuality: null,
      qualityDetails: null,
      qualityDetailsError: null,
      color: null,
      quantityInKgs: null,
      quantityInKgsError: null,
      deliveryArea: null,
      deliveryAreaError: null,
      deliveryPeriod: null,
      paymentTerms: null,
      paymentTermsError: null,
      inquiryClosesWithin: null,
      sendRequirementTo: null,
      additionalComment: null,
      additionalCommentError: null,
      wantToTestReport: false,
    );
  }
}

enum YarnRequirementIntention {
  priceInquiry,
  purchase,
  none,
}
