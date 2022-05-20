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
      userId: json['userId'] as String?,
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
  writeNotNull('accountName', instance.accountName);
  writeNotNull('accountNumber', instance.accountNumber);
  writeNotNull('iFSCCode', instance.iFSCCode);
  writeNotNull('bankName', instance.bankName);
  writeNotNull('bankBranch', instance.bankBranch);
  writeNotNull('bankState', instance.bankState);
  writeNotNull('bankCity', instance.bankCity);
  writeNotNull('addressProofUrl', instance.addressProofUrl);
  writeNotNull('cancelledChequeUrl', instance.cancelledChequeUrl);
  writeNotNull('userId', instance.userId);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
