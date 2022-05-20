import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/gst_number.dart';
import 'package:yarn_bazaar/domain/value_objects/pan_number.dart';
import 'package:yarn_bazaar/domain/value_objects/tan_number.dart';

class BusinessDetail extends Entity {
  final String? companyName;
  final String? accountType;
  final List<String>? categories;
  final String? address;
  final String? completeAddress;
  final GSTNumber? gstNo;
  final TANNumber? tanNo;
  final String? gstDocumentUrl;
  final PANNumber? panNo;
  final String? panCardUrl;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BusinessDetail._({
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
    required this.userId,
    this.createdAt,
    this.updatedAt,
  }) : super(id);

  static Option<BusinessDetail> create({
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
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    if ([
      id,
      companyName,
      accountType,
      categories,
      userId,
      createdAt,
      updatedAt,
    ].any((element) => element == null)) none();

    final gstNumberObject = GSTNumber.create(gstNo);
    final tanNumberObject = TANNumber.create(tanNo);
    final panNumberObject = PANNumber.create(panNo);

    if (gstNumberObject.isLeft() || tanNumberObject.isLeft() || panNumberObject.isLeft())
      return none();

    return some(BusinessDetail._(
      id: id,
      companyName: companyName!,
      accountType: accountType!,
      categories: categories!,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNumberObject.fold((l) => null, (r) => r),
      gstDocumentUrl: gstDocumentUrl,
      tanNo: tanNumberObject.fold((l) => null, (r) => r),
      panNo: panNumberObject.fold((l) => null, (r) => r),
      panCardUrl: panCardUrl,
      userId: userId!,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
    ));
  }

  static Option<BusinessDetail> createFromInput({
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
    String? userId,
  }) {
    if ([
      id,
      companyName,
      accountType,
      categories,
      userId,
    ].any((element) => element == null)) none();

    final gstNumberObject = GSTNumber.create(gstNo!);
    final tanNumberObject = TANNumber.create(tanNo!);
    final panNumberObject = PANNumber.create(panNo!);

    if (gstNumberObject.isLeft() || tanNumberObject.isLeft() || panNumberObject.isLeft())
      return none();

    return some(BusinessDetail._(
      companyName: companyName!,
      accountType: accountType!,
      categories: categories!,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNumberObject.fold((l) => null, (r) => r),
      gstDocumentUrl: gstDocumentUrl!,
      tanNo: tanNumberObject.fold((l) => null, (r) => r),
      panNo: panNumberObject.fold((l) => null, (r) => r),
      panCardUrl: panCardUrl!,
      userId: userId!,
    ));
  }

  static Option<BusinessDetail> createForUpdate({
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
    String? userId,
  }) {
    if (id == null) none();

    final gstNumberObject = gstNo == null ? null : GSTNumber.create(gstNo);
    final tanNumberObject = tanNo == null ? null : TANNumber.create(tanNo);
    final panNumberObject = panNo == null ? null : PANNumber.create(panNo);

    if (gstNumberObject != null && gstNumberObject.isLeft() ||
        tanNumberObject != null && tanNumberObject.isLeft() ||
        panNumberObject != null && panNumberObject.isLeft()) return none();

    return some(BusinessDetail._(
      companyName: companyName!,
      accountType: accountType!,
      categories: categories!,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNumberObject?.fold((l) => null, (r) => r),
      gstDocumentUrl: gstDocumentUrl!,
      tanNo: tanNumberObject?.fold((l) => null, (r) => r),
      panNo: panNumberObject?.fold((l) => null, (r) => r),
      panCardUrl: panCardUrl!,
      userId: userId!,
    ));
  }
}
