import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/suggestion.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

part 'suggestion_dto.g.dart';

@JsonSerializable()
class SuggestionDto extends IdDto implements TimeStampedDto {
  @JsonKey(includeIfNull: false)
  @override
  final String? id;
  final String suggestionType;
  final String suggestionBody;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  const SuggestionDto({
    this.id,
    required this.suggestionType,
    required this.suggestionBody,
    this.createdAt,
    this.updatedAt,
  });

  factory SuggestionDto.fromJson(Map<String, dynamic> map) => _$SuggestionDtoFromJson(map);

  Map<String, dynamic> toJson() => _$SuggestionDtoToJson(this);

  @override
  Option<Suggestion> toDomain() {
    return Suggestion.create(
      id: id,
      suggestionType: suggestionType,
      suggestionBody: suggestionBody,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static SuggestionDto fromDomain(Suggestion suggestion) {
    return SuggestionDto(
      id: suggestion.id,
      suggestionType: suggestion.suggestionType.getString(),
      suggestionBody: suggestion.suggestionBody.value,
      createdAt: suggestion.createdAt,
      updatedAt: suggestion.updatedAt,
    );
  }
}
