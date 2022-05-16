// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetailDto _$BankDetailDtoFromJson(Map<String, dynamic> json) =>
    BankDetailDto(
      id: json['id'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      iFSCCode: json['iFSCCode'] as String?,
      bankName: json['bankName'] as String?,
      bankBranch: json['bankBranch'] as String?,
      bankState: json['bankState'] as String?,
      bankCity: json['bankCity'] as String?,
      addressProofUrl: json['addressProofUrl'] as String?,
      cancelledChequeUrl: json['cancelledChequeUrl'] as String?,
      userId: json['userId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BankDetailDtoToJson(BankDetailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['accountName'] = instance.accountName;
  val['accountNumber'] = instance.accountNumber;
  val['iFSCCode'] = instance.iFSCCode;
  val['bankName'] = instance.bankName;
  val['bankBranch'] = instance.bankBranch;
  val['bankState'] = instance.bankState;
  val['bankCity'] = instance.bankCity;
  val['addressProofUrl'] = instance.addressProofUrl;
  val['cancelledChequeUrl'] = instance.cancelledChequeUrl;
  val['userId'] = instance.userId;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
