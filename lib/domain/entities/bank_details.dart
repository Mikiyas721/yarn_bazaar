import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/account_number.dart';
import 'package:yarn_bazaar/domain/value_objects/ifsc_code.dart';

class BankDetail extends Entity {
  final String? accountName;
  final AccountNumber? accountNumber;
  final IFSCCode? iFSCCode;
  final String? bankName;
  final String? bankBranch;
  final String? bankState;
  final String? bankCity;
  final String? addressProofUrl;
  final String? cancelledChequeUrl;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BankDetail({
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
    required this.userId,
    this.createdAt,
    this.updatedAt,
  }) : super(id);

  static Option<BankDetail> create({
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
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    if ([id, accountName, userId, createdAt, updatedAt].any((element) => element == null))
      return none();

    final accountNumberObject = AccountNumber.create(accountNumber);
    final ifscCodeObject = IFSCCode.create(iFSCCode);

    if (accountNumberObject.isLeft() || ifscCodeObject.isLeft()) return none();

    return some(BankDetail(
      id: id,
      accountName: accountName,
      accountNumber:
          accountNumberObject.getOrElse(() => throw Exception('Account number error')),
      iFSCCode: ifscCodeObject.getOrElse(() => throw Exception('IFSC code error')),
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
      userId: userId!,
      createdAt: createdAt,
      updatedAt: updatedAt,
    ));
  }

  static Option<BankDetail> createFromInput({
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
    String? userId,
  }) {
    if (userId == null) return none();
    final accountNumberObject = AccountNumber.create(accountNumber);
    final ifscCodeObject = IFSCCode.create(iFSCCode);

    if (accountNumberObject.isLeft() || ifscCodeObject.isLeft()) return none();

    return some(BankDetail(
      accountName: accountName,
      accountNumber:
          accountNumberObject.getOrElse(() => throw Exception('Account number error')),
      iFSCCode: ifscCodeObject.getOrElse(() => throw Exception('IFSC code error')),
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      userId: userId,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
    ));
  }

  static Option<BankDetail> createForUpdate({
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
    String? userId,
  }) {
    if (id == null) return none();

    final accountNumberObject =
        accountNumber == null ? null : AccountNumber.create(accountNumber);
    final ifscCodeObject = iFSCCode == null ? null : IFSCCode.create(iFSCCode);

    if (accountNumberObject != null && accountNumberObject.isLeft() ||
        ifscCodeObject != null && ifscCodeObject.isLeft()) return none();

    return some(BankDetail(
      accountName: accountName,
      accountNumber: accountNumberObject?.fold((l) => null, (r) => r),
      iFSCCode: ifscCodeObject?.fold((l) => null, (r) => r),
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      userId: userId,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
    ));
  }
}
