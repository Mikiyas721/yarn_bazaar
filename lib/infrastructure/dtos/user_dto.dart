import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends IdDto implements TimeStampedDto {
  @override
  @JsonKey(includeIfNull: false)
  final String? id;
  final String? imageUrl;
  final String firstName;
  final String? lastName;
  final String phoneNumber;
  final String? country;
  final String? city;
  final String? email;
  final String? website;
  final String password;
  final String businessDetailsId;
  final String bankDetailsId;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  const UserDto({
    required this.id,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.email,
    required this.website,
    required this.password,
    required this.businessDetailsId,
    required this.bankDetailsId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> map) => _$UserDtoFromJson(map);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  Option<User> toDomain() {
    return User.create(
      id: id,
      imageUrl: imageUrl,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
      email: email,
      website: website,
      password: password,
      businessDetailsId: businessDetailsId,
      bankDetailsId: bankDetailsId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static UserDto fromDomain(User user) {
    return UserDto(
      id: user.id,
      imageUrl: user.imageUrl,
      firstName: user.firstName.value,
      lastName: user.lastName?.value,
      phoneNumber: user.phoneNumber.value,
      country: user.country,
      city: user.city,
      email: user.email?.value,
      website: user.website?.value,
      password: user.password.value,
      businessDetailsId: user.businessDetailsId,
      bankDetailsId: user.bankDetailsId,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}
