import 'package:yarn_bazaar/common/view_model.dart';

class SuggestionViewModel extends ViewModel {
  final String? suggestionType;
  final String? suggestionBody;
  final String? suggestionBodyError;
  final bool hasSubmitted;
  final bool isAddingSuggestion;

  SuggestionViewModel({
    required this.suggestionType,
    required this.suggestionBody,
    required this.suggestionBodyError,
    required this.hasSubmitted,
    required this.isAddingSuggestion,
  });

  @override
  List<Object?> get props => [
        suggestionType,
        suggestionBody,
        suggestionBodyError,
        hasSubmitted,
        isAddingSuggestion,
      ];
}
