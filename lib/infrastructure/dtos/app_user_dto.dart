import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';

part 'app_user_dto.g.dart';

@JsonSerializable()
class AppUserDto extends IdDto {
  @override
  final String? id;
  @JsonKey(includeIfNull: false) final String? imageUrl;
  final String firstName;
  @JsonKey(includeIfNull: false) final String? lastName;
  final String phoneNumber;
  final String companyName;
  final String accountType;
  final List<String> categories;
  final String? password;
  final String? businessDetailId;
  final String? bankDetailId;

  const AppUserDto({
    required this.id,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.companyName,
    required this.accountType,
    required this.categories,
    required this.password,
    required this.businessDetailId,
    required this.bankDetailId,
  });

  factory AppUserDto.fromJson(Map<String, dynamic> map) => _$AppUserDtoFromJson(map);

  Map<String, dynamic> toJson() => _$AppUserDtoToJson(this);

  @override
  Option<AppUser> toDomain() {
    return AppUser.create(
      id: id,
      imageUrl: imageUrl,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      companyName: companyName,
      accountType: accountType,
      categories: categories,
      password: password,
      businessDetailId: businessDetailId,
      bankDetailId: bankDetailId
    );
  }

  static AppUserDto fromDomain(AppUser user) {
    return AppUserDto(
      id: user.id,
      imageUrl: user.imageUrl,
      firstName: user.firstName.value!,
      lastName: user.lastName?.value,
      phoneNumber: user.phoneNumber.value,
      companyName: user.companyName.value,
      accountType: user.accountType,
      categories: user.categories,
      password: user.password?.value,
      businessDetailId: user.businessDetailId,
      bankDetailId: user.bankDetailId,
    );
  }
}
