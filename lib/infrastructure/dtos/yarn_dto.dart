import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/infrastructure/dtos/user_dto.dart';

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
  final String userId;
  final UserDto? user;
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
    this.qualityDetail,
    required this.colour,
    required this.quantity,
    required this.deliveryArea,
    required this.deliveryPeriod,
    required this.paymentTerms,
    required this.closesWithin,
    required this.sendTo,
    this.additionalComment,
    required this.userId,
    this.user,
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
      yarnType: yarnType,
      purpose: purpose,
      qualityDetails: qualityDetail,
      colour: colour,
      quantityInKgs: quantity.toString(),
      deliveryArea: deliveryArea,
      deliveryPeriod: deliveryPeriod,
      paymentTerms: paymentTerms,
      inquiryClosesWithIn: closesWithin,
      sendRequirementTo: sendTo,
      additionalComments: additionalComment,
      userId: userId,
      user: user?.toDomain().fold(() => null, (a) => a),
      createdAt: createdAt,
      updatedAt: updatedAt,
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
      user: yarn.user == null ? null : UserDto.fromDomain(yarn.user!),
      createdAt: yarn.createdAt,
      updatedAt: yarn.updatedAt,
    );
  }
}
