part of 'add_yarn_requirement_bloc.dart';

abstract class AddYarnRequirementEvent extends BlocEvent<AddYarnRequirementState> {}

class AddYarnRequirementIntentionChangedEvent extends AddYarnRequirementEvent {
  final YarnRequirementIntention intention;

  AddYarnRequirementIntentionChangedEvent(this.intention);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(intention: intention);
  }
}

class AddYarnRequirementYarnQualityDetailChangedEvent extends AddYarnRequirementEvent {
  final String yarnQuality;

  AddYarnRequirementYarnQualityDetailChangedEvent(this.yarnQuality);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(yarnQuality: yarnQuality);
  }
}

class AddYarnRequirementQualityDetailsChangedEvent extends AddYarnRequirementEvent {
  final String qualityDetails;

  AddYarnRequirementQualityDetailsChangedEvent(this.qualityDetails);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(qualityDetails: qualityDetails);
  }
}

class AddYarnRequirementColorChangedEvent extends AddYarnRequirementEvent {
  final String color;

  AddYarnRequirementColorChangedEvent(this.color);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(color: color);
  }
}

class AddYarnRequirementQuantityInKgsChangedEvent extends AddYarnRequirementEvent {
  final String quantityInKgs;

  AddYarnRequirementQuantityInKgsChangedEvent(this.quantityInKgs);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(quantityInKgs: Quantity.create(quantityInKgs));
  }
}

class AddYarnRequirementDeliveryAreaChangedEvent extends AddYarnRequirementEvent {
  final String deliveryArea;

  AddYarnRequirementDeliveryAreaChangedEvent(this.deliveryArea);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(deliveryArea: Location.create(deliveryArea));
  }
}

class AddYarnRequirementDeliveryPeriodChangedEvent extends AddYarnRequirementEvent {
  final String deliveryPeriod;

  AddYarnRequirementDeliveryPeriodChangedEvent(this.deliveryPeriod);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(deliveryPeriod: deliveryPeriod);
  }
}

class AddYarnRequirementPaymentTermsChangedEvent extends AddYarnRequirementEvent {
  final String paymentTerms;

  AddYarnRequirementPaymentTermsChangedEvent(this.paymentTerms);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(paymentTerms: PaymentTerms.create(paymentTerms));
  }
}

class AddYarnRequirementInquiryClosesWithinChangedEvent extends AddYarnRequirementEvent {
  final String inquiryClosesWithin;

  AddYarnRequirementInquiryClosesWithinChangedEvent(this.inquiryClosesWithin);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(inquiryClosesWithin: inquiryClosesWithin);
  }
}

class AddYarnRequirementSendRequirementToChangedEvent extends AddYarnRequirementEvent {
  final String sendRequirementTo;

  AddYarnRequirementSendRequirementToChangedEvent(this.sendRequirementTo);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(sendRequirementTo: sendRequirementTo);
  }
}

class AddYarnRequirementAdditionalCommentChangedEvent extends AddYarnRequirementEvent {
  final String additionalComment;

  AddYarnRequirementAdditionalCommentChangedEvent(this.additionalComment);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(additionalComment: additionalComment);
  }
}

class AddYarnRequirementWantToTestReportChangedEvent extends AddYarnRequirementEvent {
  final bool wantToTestReport;

  AddYarnRequirementWantToTestReportChangedEvent(this.wantToTestReport);

  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(wantToTestReport: wantToTestReport);
  }
}

class AddYarnRequirementSubmittedEvent extends AddYarnRequirementEvent {
  @override
  Stream<AddYarnRequirementState> handle(AddYarnRequirementState currentState) async* {
    yield currentState.copyWith(hasSubmitted: true);
  }
}
