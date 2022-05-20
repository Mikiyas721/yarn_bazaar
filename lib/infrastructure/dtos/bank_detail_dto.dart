import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';

part 'bank_detail_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class BankDetailDto extends IdDto implements TimeStampedDto {
  @override
  final String? id;
  final String? accountName;
  final String? accountNumber;
  final String? iFSCCode;
  final String? bankName;
  final String? bankBranch;
  final String? bankState;
  final String? bankCity;
  final String? addressProofUrl;
  final String? cancelledChequeUrl;
  final String? userId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  const BankDetailDto({
    required this.id,
    this.accountName,
    this.accountNumber,
    this.iFSCCode,
    this.bankName,
    this.bankBranch,
    this.bankState,
    this.bankCity,
    this.addressProofUrl,
    this.cancelledChequeUrl,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankDetailDto.fromJson(Map<String, dynamic> map) => _$BankDetailDtoFromJson(map);

  Map<String, dynamic> toJson() => _$BankDetailDtoToJson(this);

  @override
  Option<BankDetail> toDomain() {
    return BankDetail.create(
      id: id,
      accountName: accountName,
      accountNumber: accountNumber,
      iFSCCode: iFSCCode,
      bankName: bankName,
      bankBranch: bankBranch,
      bankState: bankState,
      bankCity: bankCity,
      addressProofUrl: addressProofUrl,
      cancelledChequeUrl: cancelledChequeUrl,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static BankDetailDto fromDomain(BankDetail bankDetails) {
    return BankDetailDto(
      id: bankDetails.id,
      accountName: bankDetails.accountName,
      accountNumber: bankDetails.accountNumber?.value,
      iFSCCode: bankDetails.iFSCCode?.value,
      bankName: bankDetails.bankName,
      bankBranch: bankDetails.bankBranch,
      bankState: bankDetails.bankState,
      bankCity: bankDetails.bankCity,
      addressProofUrl: bankDetails.addressProofUrl,
      cancelledChequeUrl: bankDetails.cancelledChequeUrl,
      userId: bankDetails.userId,
      createdAt: bankDetails.createdAt,
      updatedAt: bankDetails.updatedAt,
    );
  }
}
