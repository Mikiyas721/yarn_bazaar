import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/company_name.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

class AppUser extends Entity {
  final String? imageUrl;
  final Name firstName;
  final Name? lastName;
  final PhoneNumber phoneNumber;
  final CompanyName companyName;
  final String accountType;
  final List<String> categories;
  final Password? password;
  final String? businessDetailId;
  final String? bankDetailId;

  AppUser._({
    String? id,
    this.imageUrl,
    required this.firstName,
    required this.phoneNumber,
    this.lastName,
    required this.companyName,
    required this.accountType,
    required this.categories,
    this.password,
    this.businessDetailId,
    this.bankDetailId,
  }) : super(id);

  static Option<AppUser> create({
    String? id,
    String? imageUrl,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    String? companyName,
    String? accountType,
    List<String>? categories,
    String? password,
    String? businessDetailId,
    String? bankDetailId,
  }) {
    if ([
      id,
      firstName,
      phoneNumber,
      companyName,
      accountType,
      categories,
      businessDetailId,
      bankDetailId,
    ].any((element) => element == null)) return none();
    final firstNameObject = Name.create(firstName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final companyNameObject = CompanyName.create(companyName!);
    final passwordObject = password==null?null:Password.create(password);
    if (id!.isEmpty ||
        categories!.isEmpty ||
        firstNameObject.isLeft() ||
        companyNameObject.isLeft()) return none();

    return some(AppUser._(
      id: id,
      imageUrl: imageUrl,
      firstName: firstNameObject.getOrElse(() => throw Exception('First name error')),
      phoneNumber: phoneNumberObject.getOrElse(() => throw Exception('Phone number error')),
      lastName: lastName == null
          ? null
          : Name.create(lastName).getOrElse(() => throw Exception('Last name error')),
      companyName: companyNameObject.getOrElse(() => throw Exception('Company name error')),
      accountType: accountType!,
      categories: categories,
      password: passwordObject?.fold((l) => null, (r)=>r),
      businessDetailId: businessDetailId!,
      bankDetailId: bankDetailId!,
    ));
  }

  static Option<AppUser> createFromInput({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? companyName,
    String? accountType,
    List<String>? categories,
    String? password,
  }) {
    if ([
      firstName,
      phoneNumber,
      companyName,
      accountType,
      categories,
      password,
    ].any((element) => element == null)) return none();
    final firstNameObject = Name.create(firstName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final companyNameObject = CompanyName.create(companyName!);
    final passwordObject = Password.create(password!);
    if (categories!.isEmpty ||
        firstNameObject.isLeft() ||
        companyNameObject.isLeft() ||
        passwordObject.isLeft()) return none();

    return some(AppUser._(
        firstName: firstNameObject.getOrElse(() => throw Exception('First name error')),
        phoneNumber: phoneNumberObject.getOrElse(() => throw Exception('Phone number error')),
        lastName: lastName == null
            ? null
            : Name.create(lastName).getOrElse(() => throw Exception('Last name error')),
        companyName: companyNameObject.getOrElse(() => throw Exception('Company name error')),
        accountType: accountType!,
        categories: categories,
        password: passwordObject.getOrElse(() => throw Exception('Password error'))));
  }
}
