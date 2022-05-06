import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'yarn_dto.g.dart';

@JsonSerializable()
class YarnDto extends IdDto implements TimeStampedDto {
  @override
  @JsonKey(includeIfNull: false)
  final String? id;
  final String intention;
  final String count;
  final String yarnType;
  final String purpose;
  final String? qualityDetail;
  final String colour;
  final double quantity;
  final String deliveryArea;
  final String deliveryPeriod;
  final String paymentTerms;
  final String closesWithin;
  final String sendTo;
  final String? additionalComment;
  @JsonKey(includeIfNull: false)
  final String? userId;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  const YarnDto({
    required this.id,
    required this.intention,
    required this.count,
    required this.yarnType,
    required this.purpose,
    required this.qualityDetail,
    required this.colour,
    required this.quantity,
    required this.deliveryArea,
    required this.deliveryPeriod,
    required this.paymentTerms,
    required this.closesWithin,
    required this.sendTo,
    required this.additionalComment,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory YarnDto.fromJson(Map<String, dynamic> map) => _$YarnDtoFromJson(map);

  Map<String, dynamic> toJson() => _$YarnDtoToJson(this);

  @override
  Option<Yarn> toDomain() {
    return Yarn.create(
      id: id,
      intention: intention,
      count: count,
      yarnType:yarnType,
      purpose:purpose,
      qualityDetails: qualityDetail,
      colour: colour,
      quantityInKgs: quantity.toString(),
      deliveryArea: deliveryArea,
      deliveryPeriod: deliveryPeriod,
      paymentTerms: paymentTerms,
      inquiryClosesWithIn: closesWithin,
      sendRequirementTo: sendTo,
      additionalComments: additionalComment,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
    );
  }

  static YarnDto fromDomain(Yarn yarn) {
    return YarnDto(
      id: yarn.id,
      intention: yarn.intention,
      count: yarn.count,
      yarnType: yarn.yarnType,
      purpose: yarn.purpose,
      qualityDetail: yarn.qualityDetails,
      colour: yarn.colour,
      quantity: yarn.quantityInKgs.value,
      deliveryArea: yarn.deliveryArea.value,
      deliveryPeriod: yarn.deliveryPeriod,
      paymentTerms: yarn.paymentTerms.value,
      closesWithin: yarn.inquiryClosesWithIn,
      sendTo: yarn.sendRequirementTo,
      additionalComment: yarn.additionalComments,
      userId: yarn.userId,
      createdAt: yarn.createdAt,
      updatedAt: yarn.updatedAt,
    );
  }
}
