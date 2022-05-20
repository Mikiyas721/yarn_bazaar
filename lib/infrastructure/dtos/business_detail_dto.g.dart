// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetailDto _$BusinessDetailDtoFromJson(Map<String, dynamic> json) =>
    BusinessDetailDto(
      id: json['id'] as String?,
      companyName: json['companyName'] as String?,
      accountType: json['accountType'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      address: json['address'] as String?,
      completeAddress: json['completeAddress'] as String?,
      gstNo: json['gstNo'] as String?,
      tanNo: json['tanNo'] as String?,
      gstDocumentUrl: json['gstDocumentUrl'] as String?,
      panNo: json['panNo'] as String?,
      panCardUrl: json['panCardUrl'] as String?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BusinessDetailDtoToJson(BusinessDetailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('companyName', instance.companyName);
  writeNotNull('accountType', instance.accountType);
  writeNotNull('categories', instance.categories);
  writeNotNull('address', instance.address);
  writeNotNull('completeAddress', instance.completeAddress);
  writeNotNull('gstNo', instance.gstNo);
  writeNotNull('tanNo', instance.tanNo);
  writeNotNull('gstDocumentUrl', instance.gstDocumentUrl);
  writeNotNull('panNo', instance.panNo);
  writeNotNull('panCardUrl', instance.panCardUrl);
  writeNotNull('userId', instance.userId);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
