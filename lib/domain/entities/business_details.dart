import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/domain/entities/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/gst_number.dart';
import 'package:yarn_bazaar/domain/value_objects/pan_number.dart';
import 'package:yarn_bazaar/domain/value_objects/tan_number.dart';

class BusinessDetails extends Entity {
  final String companyName;
  final String accountType;
  final List<String> categories;
  final String? address;
  final String? completeAddress;
  final GSTNumber gstNo;
  final TANNumber tanNo;
  final String? gstDocumentUrl;
  final PANNumber panNo;
  final String? panCardUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BusinessDetails._({
    String? id,
    required this.companyName,
    required this.accountType,
    required this.categories,
    this.address,
    this.completeAddress,
    required this.gstNo,
    required this.tanNo,
    this.gstDocumentUrl,
    required this.panNo,
    this.panCardUrl,
    this.createdAt,
    this.updatedAt,
  }) : super(id);

  Option<BusinessDetails> create(
    String? id,
    String? companyName,
    String? accountType,
    List<String>? categories,
    String? address,
    String? completeAddress,
    String? gstNo,
    String? tanNo,
    String? gstDocumentUrl,
    String? panNo,
    String? panCardUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  ) {
    if ([
      id,
      companyName,
      accountType,
      categories,
      address,
      completeAddress,
      gstNo,
      tanNo,
      gstDocumentUrl,
      panNo,
      panCardUrl,
      createdAt,
      updatedAt,
    ].any((element) => element == null)) none();

    final gstNumberObject = GSTNumber.create(gstNo!);
    final tanNumberObject = TANNumber.create(tanNo!);
    final panNumberObject = PANNumber.create(panNo!);

    if (gstNumberObject.isLeft() ||
        tanNumberObject.isLeft() ||
        panNumberObject.isLeft()) return none();

    return some(BusinessDetails._(
      id: id,
      companyName: companyName!,
      accountType: accountType!,
      categories: categories!,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNumberObject
          .getOrElse(() => throw Exception('GST Number exception')),
      gstDocumentUrl: gstDocumentUrl!,
      tanNo: tanNumberObject
          .getOrElse(() => throw Exception('TAN Number exception')),
      panNo: panNumberObject
          .getOrElse(() => throw Exception('PAN Number exception')),
      panCardUrl: panCardUrl!,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
    ));
  }

  Option<BusinessDetails> createFromInput(
      String? companyName,
      String? accountType,
      List<String>? categories,
      String? address,
      String? completeAddress,
      String? gstNo,
      String? tanNo,
      String? gstDocumentUrl,
      String? panNo,
      String? panCardUrl,
      ) {
    if ([
      companyName,
      accountType,
      categories,
    ].any((element) => element == null)) none();

    final gstNumberObject = GSTNumber.create(gstNo!);
    final tanNumberObject = TANNumber.create(tanNo!);
    final panNumberObject = PANNumber.create(panNo!);

    if (gstNumberObject.isLeft() ||
        tanNumberObject.isLeft() ||
        panNumberObject.isLeft()) return none();

    return some(BusinessDetails._(
      companyName: companyName!,
      accountType: accountType!,
      categories: categories!,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNumberObject
          .getOrElse(() => throw Exception('GST Number exception')),
      gstDocumentUrl: gstDocumentUrl!,
      tanNo: tanNumberObject
          .getOrElse(() => throw Exception('TAN Number exception')),
      panNo: panNumberObject
          .getOrElse(() => throw Exception('PAN Number exception')),
      panCardUrl: panCardUrl!,
    ));
  }
}
