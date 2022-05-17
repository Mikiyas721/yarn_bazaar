import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/suggestion_body.dart';
import 'package:yarn_bazaar/domain/value_objects/suggestion_type.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class Suggestion extends Entity {
  final SuggestionType suggestionType;
  final SuggestionBody suggestionBody;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Suggestion._({
    String? id,
    required this.suggestionType,
    required this.suggestionBody,
    this.createdAt,
    this.updatedAt,
  }) : super(id);

  static Option<Suggestion> create({
    String? id,
    String? suggestionType,
    String? suggestionBody,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    if ([
      id,
      suggestionType,
      suggestionBody,
      createdAt,
      updatedAt,
    ].any((element) => element == null)) return none();
    final suggestionBodyObject = SuggestionBody.create(suggestionBody!);
    if (suggestionBodyObject.isLeft()) return none();
    return some(
      Suggestion._(
        id: id,
        suggestionType: suggestionType!.getSuggestionType(),
        suggestionBody: suggestionBodyObject.getOrElse(
          () => throw Exception("Suggestion Body Error"),
        ),
        updatedAt: updatedAt,
        createdAt: createdAt,
      ),
    );
  }

  static Option<Suggestion> createFromInput({
    String? suggestionType,
    String? suggestionBody,
  }) {
    if ([
      suggestionType,
      suggestionBody,
    ].any((element) => element == null)) return none();
    final suggestionBodyObject = SuggestionBody.create(suggestionBody!);
    if (suggestionBodyObject.isLeft()) return none();
    return some(
      Suggestion._(
        suggestionType: suggestionType!.getSuggestionType(),
        suggestionBody: suggestionBodyObject.getOrElse(
          () => throw Exception("Suggestion Body Error"),
        ),
      ),
    );
  }
}
