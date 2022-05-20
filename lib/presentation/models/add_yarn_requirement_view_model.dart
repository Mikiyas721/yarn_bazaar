import 'package:yarn_bazaar/common/view_model.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';

class AddYarnRequirementViewModel extends ViewModel {
  final YarnRequirementIntention intention;
  final String? yarnQualityError;
  final String? colorError;
  final String? quantityInKgsError;
  final String? deliveryAreaError;
  final String? deliveryPeriodError;
  final String? paymentTermsError;
  final String? inquiryClosesWithinError;
  final String? sendRequirementToError;

  AddYarnRequirementViewModel({
    required this.intention,
    required this.yarnQualityError,
    required this.colorError,
    required this.quantityInKgsError,
    required this.deliveryAreaError,
    required this.deliveryPeriodError,
    required this.paymentTermsError,
    required this.inquiryClosesWithinError,
    required this.sendRequirementToError,
  });

  @override
  List<Object?> get props => [
        intention,
        yarnQualityError,
        colorError,
        quantityInKgsError,
        deliveryAreaError,
        deliveryPeriodError,
        paymentTermsError,
        inquiryClosesWithinError,
        sendRequirementToError,
      ];
}
