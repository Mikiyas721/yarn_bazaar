import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/company_name.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

class AppUser extends Entity {
  @override
  final String id;
  final String? imageUrl;
  final Name firstName;
  final Name? lastName;
  final PhoneNumber phoneNumber;
  final CompanyName companyName;
  final String businessDetailsId;
  final String bankDetailsId;

  AppUser._({
    required this.id,
    this.imageUrl,
    required this.firstName,
    required this.phoneNumber,
    this.lastName,
    required this.companyName,
    required this.businessDetailsId,
    required this.bankDetailsId,
  }) : super(id);

  static Option<AppUser> create({
    String? id,
    String? imageUrl,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    String? companyName,
    String? businessDetailsId,
    String? bankDetailsId,
  }) {
    if ([id, firstName, phoneNumber, companyName, businessDetailsId, bankDetailsId]
        .any((element) => element == null)) return none();
    final firstNameObject = Name.create(firstName!);
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final companyNameObject = CompanyName.create(companyName!);
    if (id!.isEmpty || firstNameObject.isLeft() || companyNameObject.isLeft()) return none();

    return some(AppUser._(
        id: id,
        imageUrl: imageUrl,
        firstName: firstNameObject.fold((l) => throw Exception('First name error'), (r) => r),
        phoneNumber:
            phoneNumberObject.fold((l) => throw Exception('Phone number error'), (r) => r),
        lastName: lastName == null ? null : Name.create(lastName).fold((l) => null, (r) => r),
        companyName:
            companyNameObject.fold((l) => throw Exception('Company name error'), (r) => r),
        businessDetailsId: businessDetailsId!,
        bankDetailsId: bankDetailsId!));
  }
}
