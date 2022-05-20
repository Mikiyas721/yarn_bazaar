import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/value_objects/delivery_area.dart';
import 'package:yarn_bazaar/domain/value_objects/payment_terms.dart';
import 'package:yarn_bazaar/domain/value_objects/quantity.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

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
  final int inquiryClosesWithIn;
  final String sendRequirementTo;
  final String? additionalComments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userId;
  final User? user;

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
    required this.userId,
    this.user,
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
    int? inquiryClosesWithIn,
    String? sendRequirementTo,
    String? additionalComments,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    User? user,
  }) {
    if ([
      id,
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
      createdAt,
      updatedAt,
      userId
    ].any((element) => element == null)) return none();

    final quantityObject = Quantity.create(quantityInKgs!);
    final deliveryAreaObject = Location.create(deliveryArea!);
    final paymentTermsObject = PaymentTerms.create(paymentTerms!);

    if (quantityObject.isLeft() || deliveryAreaObject.isLeft() || paymentTermsObject.isLeft())
      return none();

    return some(Yarn._(
      id: id,
      intention: intention!,
      count: count!,
      yarnType: yarnType!,
      purpose: purpose!,
      qualityDetails: qualityDetails,
      colour: colour!,
      quantityInKgs: quantityObject.getOrElse(() => throw Exception('Yarn Quantity Error')),
      deliveryArea: deliveryAreaObject.getOrElse(() => throw Exception('Delivery Area Error')),
      deliveryPeriod: deliveryPeriod!,
      paymentTerms: paymentTermsObject.getOrElse(() => throw Exception('Payment Terms Error')),
      inquiryClosesWithIn: inquiryClosesWithIn!,
      sendRequirementTo: sendRequirementTo!,
      additionalComments: additionalComments,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId!,
      user: user
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
    int? inquiryClosesWithIn,
    String? sendRequirementTo,
    String? additionalComments,
    String? userId,
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
      userId
    ].any((element) => element == null)) return none();

    if (intention == YarnRequirementIntention.None.getString()) return none();

    final quantityObject = Quantity.create(quantityInKgs!);
    final deliveryAreaObject = Location.create(deliveryArea!);
    final paymentTermsObject = PaymentTerms.create(paymentTerms!);

    if (quantityObject.isLeft() || deliveryAreaObject.isLeft() || paymentTermsObject.isLeft())
      return none();

    return some(Yarn._(
      intention: intention!,
      count: count!,
      yarnType: yarnType!,
      purpose: purpose!,
      qualityDetails: qualityDetails,
      colour: colour!,
      quantityInKgs: quantityObject.getOrElse(() => throw Exception('Yarn Quantity Error')),
      deliveryArea: deliveryAreaObject.getOrElse(() => throw Exception('Delivery Area Error')),
      deliveryPeriod: deliveryPeriod!,
      paymentTerms: paymentTermsObject.getOrElse(() => throw Exception('Payment Terms Error')),
      inquiryClosesWithIn: inquiryClosesWithIn!,
      sendRequirementTo: sendRequirementTo!,
      additionalComments: additionalComments,
      userId: userId!
    ));
  }
}
