// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetailsDto _$BusinessDetailsDtoFromJson(Map<String, dynamic> json) =>
    BusinessDetailsDto(
      id: json['id'] as String?,
      companyName: json['companyName'] as String,
      accountType: json['accountType'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      address: json['address'] as String?,
      completeAddress: json['completeAddress'] as String?,
      gstNo: json['gstNo'] as String?,
      tanNo: json['tanNo'] as String?,
      gstDocumentUrl: json['gstDocumentUrl'] as String?,
      panNo: json['panNo'] as String?,
      panCardUrl: json['panCardUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BusinessDetailsDtoToJson(BusinessDetailsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['companyName'] = instance.companyName;
  val['accountType'] = instance.accountType;
  val['categories'] = instance.categories;
  val['address'] = instance.address;
  val['completeAddress'] = instance.completeAddress;
  val['gstNo'] = instance.gstNo;
  val['tanNo'] = instance.tanNo;
  val['gstDocumentUrl'] = instance.gstDocumentUrl;
  val['panNo'] = instance.panNo;
  val['panCardUrl'] = instance.panCardUrl;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
