import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/input_selection_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/input_selection_view_model.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';
import 'package:yarn_bazaar/presentation/views/input_selection_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class InputSelectionPage extends StatelessWidget {
  const InputSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments as OptionsWithNavigationModel?);
    return Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          title: arguments == null ? Text("Error") : Text(arguments.title),
        ),
        body:
            ViewModelBuilder.withController<InputSelectionViewModel, InputSelectionController>(
          create: () => InputSelectionController(context, arguments),
          onInit: (controller) => controller.setUpSelectionView(),
          builder: (context, controller, viewModel) {
            return InputSelectionView(
              inputSelectionViewModel: viewModel!,
              onOptionSelect: controller.onOptionSelect,
              onSubmit: controller.onSubmit,
            );
          },
        ));
  }
}
