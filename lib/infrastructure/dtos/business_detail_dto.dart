import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';

part 'business_detail_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class BusinessDetailDto extends IdDto implements TimeStampedDto {
  @override
  final String? id;
  final String? companyName;
  final String? accountType;
  final List<String>? categories;
  final String? address;
  final String? completeAddress;
  final String? gstNo;
  final String? tanNo;
  final String? gstDocumentUrl;
  final String? panNo;
  final String? panCardUrl;
  final String? userId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  const BusinessDetailDto({
    required this.id,
    required this.companyName,
    required this.accountType,
    required this.categories,
    this.address,
    this.completeAddress,
    this.gstNo,
    this.tanNo,
    this.gstDocumentUrl,
    this.panNo,
    this.panCardUrl,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory BusinessDetailDto.fromJson(Map<String, dynamic> map) =>
      _$BusinessDetailDtoFromJson(map);

  Map<String, dynamic> toJson() => _$BusinessDetailDtoToJson(this);

  @override
  Option<BusinessDetail> toDomain() {
    return BusinessDetail.create(
      id: id,
      companyName: companyName,
      accountType: accountType,
      categories: categories,
      address: address,
      completeAddress: completeAddress,
      gstNo: gstNo,
      tanNo: tanNo,
      gstDocumentUrl: gstDocumentUrl,
      panNo: panNo,
      panCardUrl: panCardUrl,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static BusinessDetailDto fromDomain(BusinessDetail businessDetails) {
    return BusinessDetailDto(
      id: businessDetails.id,
      companyName: businessDetails.companyName,
      accountType: businessDetails.accountType,
      categories: businessDetails.categories,
      address: businessDetails.address,
      completeAddress: businessDetails.completeAddress,
      gstNo: businessDetails.gstNo?.value,
      tanNo: businessDetails.tanNo?.value,
      gstDocumentUrl: businessDetails.gstDocumentUrl,
      panNo: businessDetails.panNo?.value,
      panCardUrl: businessDetails.panCardUrl,
      userId: businessDetails.userId,
      createdAt: businessDetails.createdAt,
      updatedAt: businessDetails.updatedAt,
    );
  }
}
