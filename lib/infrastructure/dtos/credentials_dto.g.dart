// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsDto _$CredentialsDtoFromJson(Map<String, dynamic> json) =>
    CredentialsDto(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CredentialsDtoToJson(CredentialsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['phoneNumber'] = instance.phoneNumber;
  val['password'] = instance.password;
  return val;
}
