// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserDto _$AppUserDtoFromJson(Map<String, dynamic> json) => AppUserDto(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      companyName: json['companyName'] as String,
      businessDetailsId: json['businessDetailsId'] as String,
      bankDetailsId: json['bankDetailsId'] as String,
    );

Map<String, dynamic> _$AppUserDtoToJson(AppUserDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageUrl', instance.imageUrl);
  val['firstName'] = instance.firstName;
  writeNotNull('lastName', instance.lastName);
  val['phoneNumber'] = instance.phoneNumber;
  val['companyName'] = instance.companyName;
  val['businessDetailsId'] = instance.businessDetailsId;
  val['bankDetailsId'] = instance.bankDetailsId;
  return val;
}
