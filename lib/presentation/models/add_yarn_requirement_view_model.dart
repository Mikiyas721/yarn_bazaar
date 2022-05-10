import 'package:yarn_bazaar/common/view_model.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';

class AddYarnRequirementViewModel extends ViewModel {
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

  AddYarnRequirementViewModel({
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
}
