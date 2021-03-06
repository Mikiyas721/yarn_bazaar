import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/value_objects/email.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';
import 'package:yarn_bazaar/domain/value_objects/website.dart';

class User extends Entity {
  final String? imageUrl;
  final Name? firstName;
  final Name? lastName;
  final PhoneNumber? phoneNumber;
  final String? country;
  final String? city;
  final Email? email;
  final WebsiteUrl? website;
  final Password? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final BusinessDetail? businessDetail;
  final BankDetail? bankDetail;
  final List<Yarn>? yarns;

  static const ContainerName = 'user';

  User._({
    String? id,
    this.imageUrl,
    required this.firstName,
    this.lastName,
    required this.phoneNumber,
    this.country,
    this.city,
    this.email,
    this.website,
    required this.password,
    this.createdAt,
    this.updatedAt,
    this.businessDetail,
    this.bankDetail,
    this.yarns,
  }) : super(id);

  static Option<User> create({
    String? id,
    String? imageUrl,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? country,
    String? city,
    String? email,
    String? website,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
    BusinessDetail? businessDetail,
    BankDetail? bankDetail,
    List<Yarn>? yarns,
  }) {
    if ([
      id,
      firstName,
      phoneNumber,
      password,
      createdAt,
      updatedAt,
    ].any((element) => element == null)) return none();

    final firstNameObject = Name.create(firstName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final passwordObject = Password.create(password!);
    final emailObject = Email.create(email);
    final websiteObject = WebsiteUrl.create(website);

    if (firstNameObject.isLeft() ||
        phoneNumberObject.isLeft() ||
        passwordObject.isLeft() ||
        emailObject.isLeft() ||
        websiteObject.isLeft()) return none();

    return some(User._(
        id: id,
        imageUrl: imageUrl,
        firstName: firstNameObject.getOrElse(() => throw Exception('First name Error')),
        lastName: lastName == null ? null : Name.create(lastName).fold((l) => null, (r) => r),
        phoneNumber: phoneNumberObject.getOrElse(() => throw Exception('Phone number Error')),
        country: country,
        city: city,
        email: emailObject.fold((l) => null, (r) => r),
        website: websiteObject.fold((l) => null, (r) => r),
        password: passwordObject.getOrElse(() => throw Exception('Password Error')),
        createdAt: createdAt,
        updatedAt: updatedAt,
        businessDetail: businessDetail,
        bankDetail: bankDetail,
        yarns: yarns));
  }

  static Option<User> createFromInput({
    String? id,
    String? imageUrl,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? country,
    String? city,
    String? email,
    String? website,
    String? password,
    BusinessDetail? businessDetail,
    BankDetail? bankDetail,
    List<Yarn>? yarns,
  }) {
    if ([
      firstName,
      phoneNumber,
      password,
    ].any((element) => element == null)) return none();

    final firstNameObject = Name.create(firstName!);
    final lastNameObject = Name.create(lastName);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final emailObject = Email.create(email);
    final websiteObject = WebsiteUrl.create(website);
    final passwordObject = Password.create(password!);

    if (firstNameObject.isLeft() ||
        lastNameObject.isLeft() ||
        phoneNumberObject.isLeft() ||
        emailObject.isLeft() ||
        websiteObject.isLeft() ||
        passwordObject.isLeft()) return none();

    return some(User._(
        imageUrl: imageUrl,
        firstName: firstNameObject.getOrElse(() => throw Exception('First name Error')),
        lastName: lastNameObject.fold((l) => null, (r) => r),
        phoneNumber: phoneNumberObject.getOrElse(() => throw Exception('Phone number Error')),
        country: country,
        city: city,
        email: emailObject.fold((l) => null, (r) => r),
        website: websiteObject.fold((l) => null, (r) => r),
        password: passwordObject.getOrElse(() => throw Exception('Password Error')),
        businessDetail: businessDetail,
        bankDetail: bankDetail,
        yarns: yarns));
  }

  static Option<User> createForUpdate({
    String? id,
    String? imageUrl,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? country,
    String? city,
    String? email,
    String? website,
    String? password,
    BusinessDetail? businessDetail,
    BankDetail? bankDetail,
    List<Yarn>? yarns,
  }) {
    if (id == null) return none();

    final firstNameObject = Name.create(firstName);
    final lastNameObject = Name.create(lastName);
    final phoneNumberObject = phoneNumber == null ? null : PhoneNumber.create(phoneNumber);
    final emailObject = Email.create(email);
    final websiteObject = WebsiteUrl.create(website);
    final passwordObject = password == null ? null : Password.create(password);

    if (firstNameObject.isLeft() ||
        lastNameObject.isLeft() ||
        phoneNumberObject != null && phoneNumberObject.isLeft() ||
        emailObject.isLeft() ||
        websiteObject.isLeft() ||
        passwordObject != null && passwordObject.isLeft()) return none();

    return some(User._(
      id: id,
      imageUrl: imageUrl,
      firstName: firstNameObject.fold((l) => null, (r) => r),
      lastName: lastNameObject.fold((l) => null, (r) => r),
      phoneNumber: phoneNumberObject?.fold((l) => null, (r) => r),
      country: country,
      city: city,
      email: emailObject.fold((l) => null, (r) => r),
      website: websiteObject.fold((l) => null, (r) => r),
      password: passwordObject?.fold((l) => null, (r) => r),
      businessDetail: businessDetail,
      bankDetail: bankDetail,
      yarns: yarns,
    ));
  }
}
