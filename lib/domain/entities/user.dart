import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/email.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';
import 'package:yarn_bazaar/domain/value_objects/website.dart';

class User extends Entity {
  final String? imageUrl;
  final Name firstName;
  final Name? lastName;
  final PhoneNumber phoneNumber;
  final String? country;
  final String? city;
  final Email? email;
  final WebsiteUrl? website;
  final Password password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String businessDetailsId;
  final String bankDetailsId;
  final BusinessDetails? businessDetails;
  final BankDetails? bankDetails;

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
    required this.businessDetailsId,
    required this.bankDetailsId,
    this.businessDetails,
    this.bankDetails,
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
    String? businessDetailsId,
    String? bankDetailsId,
    BusinessDetails? businessDetails,
    BankDetails? bankDetails,
  }) {
    if ([
      id,
      imageUrl,
      firstName,
      lastName,
      phoneNumber,
      country,
      city,
      email,
      website,
      password,
      createdAt,
      updatedAt,
      businessDetailsId,
      bankDetailsId,
      businessDetails,
      bankDetails,
    ].any((element) => element == null)) return none();

    final firstNameObject = Name.create(firstName!);
    final lastNameObject = Name.create(lastName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final emailObject = Email.create(email!);
    final websiteObject = WebsiteUrl.create(website!);
    final passwordObject = Password.create(password!);

    if (firstNameObject.isLeft() ||
        lastNameObject.isLeft() ||
        phoneNumberObject.isLeft() ||
        emailObject.isLeft() ||
        websiteObject.isLeft() ||
        passwordObject.isLeft()) return none();

    return some(User._(
      id: id,
      imageUrl: imageUrl,
      firstName:
          firstNameObject.getOrElse(() => throw Exception('First name Error')),
      lastName:
          firstNameObject.getOrElse(() => throw Exception('Last name Error')),
      phoneNumber: phoneNumberObject
          .getOrElse(() => throw Exception('Phone number Error')),
      country: country,
      city: city,
      email: emailObject.getOrElse(() => throw Exception('Email Error')),
      website: websiteObject.getOrElse(() => throw Exception('Website Error')),
      password:
          passwordObject.getOrElse(() => throw Exception('Password Error')),
      createdAt: createdAt,
      updatedAt: updatedAt,
      businessDetailsId: businessDetailsId!,
      bankDetailsId: bankDetailsId!,
      businessDetails: businessDetails,
      bankDetails: bankDetails,
    ));
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
    String? businessDetailsId,
    String? bankDetailsId,
    BusinessDetails? businessDetails,
    BankDetails? bankDetails,
  }) {
    if ([
      firstName,
      phoneNumber,
      password,
      businessDetailsId,
      bankDetailsId,
    ].any((element) => element == null)) return none();

    final firstNameObject = Name.create(firstName!);
    final lastNameObject = Name.create(lastName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final emailObject = Email.create(email!);
    final websiteObject = WebsiteUrl.create(website!);
    final passwordObject = Password.create(password!);

    if (firstNameObject.isLeft() ||
        lastNameObject.isLeft() ||
        phoneNumberObject.isLeft() ||
        emailObject.isLeft() ||
        websiteObject.isLeft() ||
        passwordObject.isLeft()) return none();

    return some(User._(
      imageUrl: imageUrl,
      firstName:
          firstNameObject.getOrElse(() => throw Exception('First name Error')),
      lastName:
          firstNameObject.getOrElse(() => throw Exception('Last name Error')),
      phoneNumber: phoneNumberObject
          .getOrElse(() => throw Exception('Phone number Error')),
      country: country,
      city: city,
      email: emailObject.getOrElse(() => throw Exception('Email Error')),
      website: websiteObject.getOrElse(() => throw Exception('Website Error')),
      password:
          passwordObject.getOrElse(() => throw Exception('Password Error')),
      businessDetailsId: businessDetailsId!,
      bankDetailsId: bankDetailsId!,
      businessDetails: businessDetails,
      bankDetails: bankDetails,
    ));
  }
}
