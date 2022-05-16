// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      password: json['password'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      businessDetailDto: json['businessDetailDto'] == null
          ? null
          : BusinessDetailDto.fromJson(
              json['businessDetailDto'] as Map<String, dynamic>),
      bankDetailDto: json['bankDetailDto'] == null
          ? null
          : BankDetailDto.fromJson(
              json['bankDetailDto'] as Map<String, dynamic>),
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
  val['imageUrl'] = instance.imageUrl;
  val['firstName'] = instance.firstName;
  val['lastName'] = instance.lastName;
  val['phoneNumber'] = instance.phoneNumber;
  val['country'] = instance.country;
  val['city'] = instance.city;
  val['email'] = instance.email;
  val['website'] = instance.website;
  val['password'] = instance.password;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  val['businessDetailDto'] = instance.businessDetailDto;
  val['bankDetailDto'] = instance.bankDetailDto;
  val['yarns'] = instance.yarns;
  return val;
}
