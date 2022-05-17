// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionDto _$SuggestionDtoFromJson(Map<String, dynamic> json) =>
    SuggestionDto(
      id: json['id'] as String?,
      suggestionType: json['suggestionType'] as String,
      suggestionBody: json['suggestionBody'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SuggestionDtoToJson(SuggestionDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['suggestionType'] = instance.suggestionType;
  val['suggestionBody'] = instance.suggestionBody;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
