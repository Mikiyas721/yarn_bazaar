// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yarn_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YarnDto _$YarnDtoFromJson(Map<String, dynamic> json) => YarnDto(
      id: json['id'] as String?,
      intention: json['intention'] as String,
      count: json['count'] as String,
      yarnType: json['yarnType'] as String,
      purpose: json['purpose'] as String,
      qualityDetail: json['qualityDetail'] as String?,
      colour: json['colour'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      deliveryArea: json['deliveryArea'] as String,
      deliveryPeriod: json['deliveryPeriod'] as String,
      paymentTerms: json['paymentTerms'] as String,
      closesWithin: json['closesWithin'] as String,
      sendTo: json['sendTo'] as String,
      additionalComment: json['additionalComment'] as String?,
      userId: json['userId'] as String,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$YarnDtoToJson(YarnDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['intention'] = instance.intention;
  val['count'] = instance.count;
  val['yarnType'] = instance.yarnType;
  val['purpose'] = instance.purpose;
  val['qualityDetail'] = instance.qualityDetail;
  val['colour'] = instance.colour;
  val['quantity'] = instance.quantity;
  val['deliveryArea'] = instance.deliveryArea;
  val['deliveryPeriod'] = instance.deliveryPeriod;
  val['paymentTerms'] = instance.paymentTerms;
  val['closesWithin'] = instance.closesWithin;
  val['sendTo'] = instance.sendTo;
  val['additionalComment'] = instance.additionalComment;
  val['userId'] = instance.userId;
  val['user'] = instance.user;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
