import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/domain/value_objects/delivery_area.dart';
import 'package:yarn_bazaar/domain/value_objects/payment_terms.dart';
import 'package:yarn_bazaar/domain/value_objects/quantity.dart';

import '../../common/entity.dart';

class Yarn extends Entity {
  final String intention;
  final String count;
  final String yarnType;
  final String purpose;
  final String? qualityDetails;
  final String colour;
  final Quantity quantityInKgs;
  final Location deliveryArea;
  final String deliveryPeriod;
  final PaymentTerms paymentTerms;
  final String inquiryClosesWithIn;
  final String sendRequirementTo;
  final String? additionalComments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  Yarn._({
    String? id,
    required this.intention,
    required this.count,
    required this.yarnType,
    required this.purpose,
    this.qualityDetails,
    required this.colour,
    required this.quantityInKgs,
    required this.deliveryArea,
    required this.deliveryPeriod,
    required this.paymentTerms,
    required this.inquiryClosesWithIn,
    required this.sendRequirementTo,
    this.additionalComments,
    this.createdAt,
    this.updatedAt,
    this.userId,
  }) : super(id);

  static Option<Yarn> create({
    String? id,
    String? intention,
    String? count,
    String? yarnType,
    String? purpose,
    String? qualityDetails,
    String? colour,
    String? quantityInKgs,
    String? deliveryArea,
    String? deliveryPeriod,
    String? paymentTerms,
    String? inquiryClosesWithIn,
    String? sendRequirementTo,
    String? additionalComments,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
  }) {
    if ([
      id,
      intention,
      count,
      yarnType,
      purpose,
      qualityDetails,
      colour,
      quantityInKgs,
      deliveryArea,
      deliveryPeriod,
      paymentTerms,
      inquiryClosesWithIn,
      sendRequirementTo,
      additionalComments,
      createdAt,
      updatedAt,
      userId
    ].any((element) => element == null)) return none();

    final quantityObject = Quantity.create(quantityInKgs!);
    final deliveryAreaObject = Location.create(deliveryArea!);
    final paymentTermsObject = PaymentTerms.create(paymentTerms!);

    if (quantityObject.isLeft() ||
        deliveryAreaObject.isLeft() ||
        paymentTermsObject.isLeft()) return none();

    return some(Yarn._(
      id: id,
      intention: intention!,
      count:count!,
      yarnType:yarnType!,
      purpose:purpose!,
      colour: colour!,
      quantityInKgs: quantityObject
          .getOrElse(() => throw Exception('Yarn Quantity Error')),
      deliveryArea: deliveryAreaObject
          .getOrElse(() => throw Exception('Delivery Area Error')),
      deliveryPeriod: deliveryPeriod!,
      paymentTerms: paymentTermsObject
          .getOrElse(() => throw Exception('Payment Terms Error')),
      inquiryClosesWithIn: inquiryClosesWithIn!,
      sendRequirementTo: sendRequirementTo!,
      additionalComments: additionalComments,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
    ));
  }

  static Option<Yarn> createFromInput({
    String? intention,
    String? count,
    String? yarnType,
    String? purpose,
    String? qualityDetails,
    String? colour,
    String? quantityInKgs,
    String? deliveryArea,
    String? deliveryPeriod,
    String? paymentTerms,
    String? inquiryClosesWithIn,
    String? sendRequirementTo,
    String? additionalComments,
  }) {
    if ([
      intention,
      count,
      yarnType,
      purpose,
      colour,
      quantityInKgs,
      deliveryArea,
      deliveryPeriod,
      paymentTerms,
      inquiryClosesWithIn,
      sendRequirementTo,
    ].any((element) => element == null)) return none();

    final quantityObject = Quantity.create(quantityInKgs!);
    final deliveryAreaObject = Location.create(deliveryArea!);
    final paymentTermsObject = PaymentTerms.create(paymentTerms!);

    if (quantityObject.isLeft() ||
        deliveryAreaObject.isLeft() ||
        paymentTermsObject.isLeft()) return none();

    return some(Yarn._(
      intention: intention!,
      count:count!,
      yarnType:yarnType!,
      purpose:purpose!,
      colour: colour!,
      quantityInKgs: quantityObject
          .getOrElse(() => throw Exception('Yarn Quantity Error')),
      deliveryArea: deliveryAreaObject
          .getOrElse(() => throw Exception('Delivery Area Error')),
      deliveryPeriod: deliveryPeriod!,
      paymentTerms: paymentTermsObject
          .getOrElse(() => throw Exception('Payment Terms Error')),
      inquiryClosesWithIn: inquiryClosesWithIn!,
      sendRequirementTo: sendRequirementTo!,
      additionalComments: additionalComments,
    ));
  }
}