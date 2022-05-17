import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/suggestion_controller.dart';
import 'package:yarn_bazaar/presentation/models/suggestion_view_model.dart';
import 'package:yarn_bazaar/presentation/views/suggestion_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class SuggestionPage extends StatelessWidget {
  static const route = '/suggestionPage';

  const SuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("Suggest"),
        actions: [],
      ),
      body: ViewModelBuilder.withController<SuggestionViewModel, SuggestionController>(
          create: () => SuggestionController(context),
          builder: (context, controller, viewModel) {
            return SuggestionView(
              suggestionViewModel: viewModel!,
              onSuggestionType: controller.onSuggestionType,
              onSuggestionBody: controller.onSuggestionBody,
              onSubmit: controller.onSubmit,
              suggestionBodyController: controller.suggestionBodyController,
            );
          }),
    );
  }
}
