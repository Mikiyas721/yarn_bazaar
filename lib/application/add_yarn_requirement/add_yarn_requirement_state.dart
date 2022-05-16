part of 'add_yarn_requirement_bloc.dart';

@freezed
abstract class AddYarnRequirementState extends BlocState with _$AddYarnRequirementState {
  const factory AddYarnRequirementState({
    required YarnRequirementIntention intention,
    required String yarnQuality,
    String? qualityDetails,
    required String color,
    required Either<QuantityFailure, Quantity> quantityInKgs,
    required Either<LocationFailure, Location> deliveryArea,
    required String deliveryPeriod,
    required Either<PaymentTermsFailure, PaymentTerms> paymentTerms,
    required String inquiryClosesWithin,
    required String sendRequirementTo,
    String? additionalComment,
    required bool hasSubmitted,
  }) = _AddYarnRequirementState;

  factory AddYarnRequirementState.initial() => AddYarnRequirementState(
        intention: YarnRequirementIntention.None,
        yarnQuality: '',
        color: '',
        quantityInKgs: Quantity.create(''),
        deliveryArea: Location.create(''),
        deliveryPeriod: '',
        paymentTerms: PaymentTerms.create(''),
        inquiryClosesWithin: '',
        sendRequirementTo: '',
        hasSubmitted: false,
      );
}
