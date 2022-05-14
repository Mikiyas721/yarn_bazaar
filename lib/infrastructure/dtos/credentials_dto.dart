import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';

part 'credentials_dto.g.dart';

@JsonSerializable()
class CredentialsDto extends IdDto {
  @JsonKey(includeIfNull: false)
  @override
  final String? id;
  final String phoneNumber;
  final String password;

  const CredentialsDto({
    this.id,
    required this.phoneNumber,
    required this.password,
  });

  factory CredentialsDto.fromJson(Map<String, dynamic> map) => _$CredentialsDtoFromJson(map);

  Map<String, dynamic> toJson() => _$CredentialsDtoToJson(this);

  @override
  Option<Credentials> toDomain() {
    return Credentials.create(
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  static CredentialsDto fromDomain(Credentials credentials) {
    return CredentialsDto(
      phoneNumber: credentials.phoneNumber.value,
      password: credentials.password.value,
    );
  }
}
