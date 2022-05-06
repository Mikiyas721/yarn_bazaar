import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';

part 'bank_details_dto.g.dart';

@JsonSerializable()
class BankDetailsDto extends IdDto implements TimeStampedDto {
  @override
  @JsonKey(includeIfNull: false)
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
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  const BankDetailsDto({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankDetailsDto.fromJson(Map<String, dynamic> map) =>
      _$BankDetailsDtoFromJson(map);

  Map<String, dynamic> toJson() => _$BankDetailsDtoToJson(this);

  @override
  Option<BankDetails> toDomain() {
    return BankDetails.create(
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
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static BankDetailsDto fromDomain(BankDetails bankDetails) {
    return BankDetailsDto(
      id: bankDetails.id,
      accountName: bankDetails.accountName,
      accountNumber: bankDetails.accountNumber.value,
      iFSCCode: bankDetails.iFSCCode.value,
      bankName: bankDetails.bankName,
      bankBranch: bankDetails.bankBranch,
      bankState: bankDetails.bankState,
      bankCity: bankDetails.bankCity,
      addressProofUrl: bankDetails.addressProofUrl,
      cancelledChequeUrl: bankDetails.cancelledChequeUrl,
      createdAt: bankDetails.createdAt,
      updatedAt: bankDetails.updatedAt,
    );
  }
}
