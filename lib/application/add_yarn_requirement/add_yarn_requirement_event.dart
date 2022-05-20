part of 'add_yarn_requirement_bloc.dart';

abstract class AddYarnRequirementEvent extends BlocEvent<AddYarnRequirementState> {}

class AddYarnRequirementIntentionChangedEvent extends AddYarnRequirementEvent {
  final YarnRequirementIntention intention;

  AddYarnRequirementIntentionChangedEvent(this.intention);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(intention: intention);
  }
}

class AddYarnRequirementYarnQualityChangedEvent extends AddYarnRequirementEvent {
  final String yarnQuality;

  AddYarnRequirementYarnQualityChangedEvent(this.yarnQuality);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(yarnQuality: yarnQuality);
  }
}

class AddYarnRequirementQualityDetailsChangedEvent extends AddYarnRequirementEvent {
  final String qualityDetails;

  AddYarnRequirementQualityDetailsChangedEvent(this.qualityDetails);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(qualityDetails: qualityDetails);
  }
}

class AddYarnRequirementColorChangedEvent extends AddYarnRequirementEvent {
  final String color;

  AddYarnRequirementColorChangedEvent(this.color);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(color: color);
  }
}

class AddYarnRequirementQuantityInKgsChangedEvent extends AddYarnRequirementEvent {
  final String quantityInKgs;

  AddYarnRequirementQuantityInKgsChangedEvent(this.quantityInKgs);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(quantityInKgs: Quantity.create(quantityInKgs));
  }
}

class AddYarnRequirementDeliveryAreaChangedEvent extends AddYarnRequirementEvent {
  final String deliveryArea;

  AddYarnRequirementDeliveryAreaChangedEvent(this.deliveryArea);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(deliveryArea: Location.create(deliveryArea));
  }
}

class AddYarnRequirementDeliveryPeriodChangedEvent extends AddYarnRequirementEvent {
  final String deliveryPeriod;

  AddYarnRequirementDeliveryPeriodChangedEvent(this.deliveryPeriod);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(deliveryPeriod: deliveryPeriod);
  }
}

class AddYarnRequirementPaymentTermsChangedEvent extends AddYarnRequirementEvent {
  final String paymentTerms;

  AddYarnRequirementPaymentTermsChangedEvent(this.paymentTerms);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(paymentTerms: PaymentTerms.create(paymentTerms));
  }
}

class AddYarnRequirementInquiryClosesWithinChangedEvent extends AddYarnRequirementEvent {
  final int? inquiryClosesWithin;

  AddYarnRequirementInquiryClosesWithinChangedEvent(this.inquiryClosesWithin);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(inquiryClosesWithin: inquiryClosesWithin);
  }
}

class AddYarnRequirementSendRequirementToChangedEvent extends AddYarnRequirementEvent {
  final String sendRequirementTo;

  AddYarnRequirementSendRequirementToChangedEvent(this.sendRequirementTo);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(sendRequirementTo: sendRequirementTo);
  }
}

class AddYarnRequirementAdditionalCommentChangedEvent extends AddYarnRequirementEvent {
  final String additionalComment;

  AddYarnRequirementAdditionalCommentChangedEvent(this.additionalComment);

  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(additionalComment: additionalComment);
  }
}

class AddYarnRequirementSubmittedEvent extends AddYarnRequirementEvent {
  @override
  AddYarnRequirementState handle(AddYarnRequirementState currentState)  {
    return currentState.copyWith(hasSubmitted: true);
  }
}
