import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/account_number.dart';
import 'package:yarn_bazaar/domain/value_objects/ifsc_code.dart';

class BankDetails extends Entity {
  final String? accountName;
  final AccountNumber accountNumber;
  final IFSCCode iFSCCode;
  final String? bankName;
  final String? bankBranch;
  final String? bankState;
  final String? bankCity;
  final String? addressProofUrl;
  final String? cancelledChequeUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BankDetails({
    String? id,
    this.accountName,
    required this.accountNumber,
    required this.iFSCCode,
    this.bankName,
    this.bankBranch,
    this.bankState,
    this.bankCity,
    this.addressProofUrl,
    this.cancelledChequeUrl,
    this.createdAt,
    this.updatedAt,
  }) : super(id);

  static Option<BankDetails> create({
    String? id,
    String? accountName,
    String? accountNumber,
    String? iFSCCode,
    String? bankName,
    String? bankBranch,
    String? bankState,
    String? bankCity,
    String? addressProofUrl,
    String? cancelledChequeUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    if ([
      id,
      accountName,
      accountNumber,
      iFSCCode,
      bankName,
      bankBranch,
      bankState,
      bankCity,
      addressProofUrl,
      cancelledChequeUrl,
      createdAt,
      updatedAt
    ].any((element) => element == null)) return none();

    final accountNumberObject = AccountNumber.create(accountNumber);
    final ifscCodeObject = IFSCCode.create(iFSCCode);

    if (accountNumberObject.isLeft() || ifscCodeObject.isLeft()) return none();

    return some(BankDetails(
      id: id,
      accountName: accountName,
      accountNumber: accountNumberObject
          .getOrElse(() => throw Exception('Account number error')),
      iFSCCode:
          ifscCodeObject.getOrElse(() => throw Exception('IFSC code error')),
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    ));
  }

  static Option<BankDetails> createFromInput({
    required String id,
    String? accountName,
    String? accountNumber,
    String? iFSCCode,
    String? bankName,
    String? bankBranch,
    String? bankState,
    String? bankCity,
    String? addressProofUrl,
    String? cancelledChequeUrl,
  }) {
    final accountNumberObject = AccountNumber.create(accountNumber);
    final ifscCodeObject = IFSCCode.create(iFSCCode);

    if (accountNumberObject.isLeft() || ifscCodeObject.isLeft()) return none();

    return some(BankDetails(
      accountName: accountName,
      accountNumber: accountNumberObject
          .getOrElse(() => throw Exception('Account number error')),
      iFSCCode:
          ifscCodeObject.getOrElse(() => throw Exception('IFSC code error')),
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
    ));
  }
}
