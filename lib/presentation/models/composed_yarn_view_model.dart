import 'package:yarn_bazaar/presentation/models/view_model.dart';
import 'package:yarn_bazaar/presentation/models/yarn_requirement_view_model.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class ComposedYarnViewModel extends ViewModel {
  final String? intention;
  final String? yarnQuality;
  final String? qualityDetails;
  final String? color;
  final String? quantityInKgs;
  final String? deliveryArea;
  final String? deliveryPeriod;
  final String? paymentTerms;
  final String? inquiryClosesWithin;
  final String? sendRequirementTo;
  final String? additionalComment;

  ComposedYarnViewModel({
    required this.intention,
    required this.yarnQuality,
    required this.qualityDetails,
    required this.color,
    required this.quantityInKgs,
    required this.deliveryArea,
    required this.deliveryPeriod,
    required this.paymentTerms,
    required this.inquiryClosesWithin,
    required this.sendRequirementTo,
    required this.additionalComment,
  });

  @override
  List<Object?> get props => [
        intention,
        yarnQuality,
        qualityDetails,
        color,
        quantityInKgs,
        deliveryArea,
        deliveryPeriod,
        paymentTerms,
        inquiryClosesWithin,
        sendRequirementTo,
        additionalComment,
      ];

  //TODO remove after controller
  factory ComposedYarnViewModel.defaults() {
    return ComposedYarnViewModel(
      intention: YarnRequirementIntention.priceInquiry.getString(),
      yarnQuality: '14s Cotton Weaving',
      qualityDetails: 'qualityDetails',
      color: 'Griege',
      quantityInKgs: '100',
      deliveryArea: 'deliveryArea',
      deliveryPeriod: 'deliveryPeriod',
      paymentTerms: 'paymentTerms',
      inquiryClosesWithin: 'inquiryClosesWithin',
      sendRequirementTo: 'sendRequirementTo',
      additionalComment: 'additionalComment',
    );
  }
}
