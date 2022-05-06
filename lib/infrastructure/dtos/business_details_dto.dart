import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';

part 'business_details_dto.g.dart';

@JsonSerializable()
class BusinessDetailsDto extends IdDto implements TimeStampedDto {
  @override
  @JsonKey(includeIfNull: false)
  final String? id;
  final String companyName;
  final String accountType;
  final List<String> categories;
  final String? address;
  final String? completeAddress;
  final String? gstNo;
  final String? tanNo;
  final String? gstDocumentUrl;
  final String? panNo;
  final String? panCardUrl;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  const BusinessDetailsDto({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory BusinessDetailsDto.fromJson(Map<String, dynamic> map) =>
      _$BusinessDetailsDtoFromJson(map);

  Map<String, dynamic> toJson() => _$BusinessDetailsDtoToJson(this);

  @override
  Option<BusinessDetails> toDomain() {
    return BusinessDetails.create(
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
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static BusinessDetailsDto fromDomain(BusinessDetails businessDetails) {
    return BusinessDetailsDto(
      id: businessDetails.id,
      companyName: businessDetails.companyName,
      accountType: businessDetails.accountType,
      categories: businessDetails.categories,
      address: businessDetails.address,
      completeAddress: businessDetails.completeAddress,
      gstNo: businessDetails.gstNo.value,
      tanNo: businessDetails.tanNo.value,
      gstDocumentUrl: businessDetails.gstDocumentUrl,
      panNo: businessDetails.panNo.value,
      panCardUrl: businessDetails.panCardUrl,
      createdAt: businessDetails.createdAt,
      updatedAt: businessDetails.updatedAt,
    );
  }
}
