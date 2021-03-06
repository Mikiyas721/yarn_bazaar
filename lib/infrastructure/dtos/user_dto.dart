import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/infrastructure/dtos/bank_detail_dto.dart';
import 'package:yarn_bazaar/infrastructure/dtos/business_detail_dto.dart';
import 'package:yarn_bazaar/infrastructure/dtos/yarn_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class UserDto extends IdDto implements TimeStampedDto {
  @override
  final String? id;
  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? country;
  final String? city;
  final String? email;
  final String? website;
  final String? password;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final BusinessDetailDto? businessDetail;
  final BankDetailDto? bankDetail;
  final List<YarnDto>? yarns;

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
    required this.createdAt,
    required this.updatedAt,
    this.businessDetail,
    this.bankDetail,
    this.yarns
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
      bankDetail: bankDetail?.toDomain().fold(() => null, (a) => a),
      businessDetail: businessDetail?.toDomain().fold(() => null, (a) => a),
      yarns: IdDto.toDomainList<Yarn, YarnDto>(yarns),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static UserDto fromDomain(User user) {
    return UserDto(
      id: user.id,
      imageUrl: user.imageUrl,
      firstName: user.firstName?.value,
      lastName: user.lastName?.value,
      phoneNumber: user.phoneNumber?.value,
      country: user.country,
      city: user.city,
      email: user.email?.value,
      website: user.website?.value,
      password: user.password?.value,
      bankDetail: user.bankDetail==null?null:BankDetailDto.fromDomain(user.bankDetail!),
      businessDetail: user.businessDetail==null?null:BusinessDetailDto.fromDomain(user.businessDetail!),
      yarns: user.yarns?.map((e) => YarnDto.fromDomain(e)).toList(),
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}
