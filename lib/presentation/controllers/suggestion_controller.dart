import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/suggestion.dart';
import 'package:yarn_bazaar/domain/use_cases/add_suggestion.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/suggestion/suggestion_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/suggestion_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class SuggestionController extends BlocViewModelController<SuggestionBloc, SuggestionEvent,
    SuggestionState, SuggestionViewModel> with ShortMessageMixin {
  final suggestionBodyController = TextEditingController();

  SuggestionController(BuildContext context)
      : super(context, getIt.get<SuggestionBloc>(), true);

  @override
  SuggestionViewModel mapStateToViewModel(SuggestionState s) {
    return SuggestionViewModel(
      suggestionType: s.suggestionType.fold(() => null, (a) => a.getString()),
      suggestionBody: s.suggestionBody.fold((l) => null, (r) => r.value),
      suggestionBodyError:
          s.hasSubmitted ? s.suggestionBody.fold((l) => l.message, (r) => null) : null,
      hasSubmitted: s.hasSubmitted,
      isAddingSuggestion: s.isAddingSuggestion,
    );
  }

  onSuggestionType(String? suggestionType) {
    bloc.add(SuggestionTypeChangedEvent(getOption(suggestionType?.getSuggestionType())));
  }

  onSuggestionBody(String suggestionBody) {
    bloc.add(SuggestionBodyChangedEvent(suggestionBody));
  }

  onSubmit() {
    bloc.add(SuggestionHasSubmittedEvent());
    bloc.add(SuggestionStartedAddingSuggestionEvent());
    final suggestionObject = Suggestion.createFromInput(
        suggestionBody: currentState.suggestionBody.fold((l) => null, (r) => r.value),
        suggestionType: currentState.suggestionType.fold(
          () => null,
          (a) => a.getString(),
        ));
    suggestionObject.fold(() {
      bloc.add(SuggestionStoppedAddingSuggestionEvent());
      toastError("Invalid input(s)");
    }, (a) async {
      final apiResponse = await getIt.get<AddSuggestion>().execute(a);
      bloc.add(SuggestionStoppedAddingSuggestionEvent());
      apiResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Successfully added Suggestion");
        bloc.add(SuggestionTypeChangedEvent(none()));
        bloc.add(SuggestionBodyChangedEvent(""));
        suggestionBodyController.text = "";
      });
    });
  }
}
