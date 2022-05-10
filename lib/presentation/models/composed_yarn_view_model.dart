import 'package:yarn_bazaar/common/view_model.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

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
      intention: YarnRequirementIntention.None.getString(),
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
