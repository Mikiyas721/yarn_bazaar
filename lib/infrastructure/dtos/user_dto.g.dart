// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      businessDetail: json['businessDetail'] == null
          ? null
          : BusinessDetailDto.fromJson(
              json['businessDetail'] as Map<String, dynamic>),
      bankDetail: json['bankDetail'] == null
          ? null
          : BankDetailDto.fromJson(json['bankDetail'] as Map<String, dynamic>),
      yarns: (json['yarns'] as List<dynamic>?)
          ?.map((e) => YarnDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('country', instance.country);
  writeNotNull('city', instance.city);
  writeNotNull('email', instance.email);
  writeNotNull('website', instance.website);
  writeNotNull('password', instance.password);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('businessDetail', instance.businessDetail);
  writeNotNull('bankDetail', instance.bankDetail);
  writeNotNull('yarns', instance.yarns);
  return val;
}
