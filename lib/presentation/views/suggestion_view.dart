import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/value_objects/suggestion_type.dart';
import 'package:yarn_bazaar/presentation/models/suggestion_view_model.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';

class SuggestionView extends StatelessWidget {
  final SuggestionViewModel suggestionViewModel;
  final Function(String? suggestionType) onSuggestionType;
  final Function(String suggestionBody) onSuggestionBody;
  final VoidCallback onSubmit;
  final TextEditingController? suggestionBodyController;

  const SuggestionView({
    Key? key,
    required this.suggestionViewModel,
    required this.onSuggestionType,
    required this.onSuggestionBody,
    required this.onSubmit,
    this.suggestionBodyController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                30.vSpace,
                Card(
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: DropdownButton<String>(
                      value: suggestionViewModel.suggestionType,
                      isExpanded: true,
                      hint: Text("Select suggestion type"),
                      underline: SizedBox(),
                      items: [
                        DropdownMenuItem(
                            child: Text("Suggest a Mill"),
                            value: SuggestionType.Mill.getString()),
                        DropdownMenuItem(
                            child: Text("Suggest a Trader"),
                            value: SuggestionType.Trader.getString()),
                        DropdownMenuItem(
                            child: Text("Suggest a Broker"),
                            value: SuggestionType.Broker.getString()),
                        DropdownMenuItem(
                            child: Text("Suggest a Yarn"),
                            value: SuggestionType.Yarn.getString()),
                        DropdownMenuItem(
                            child: Text("Suggest a Feature"),
                            value: SuggestionType.Feature.getString()),
                        DropdownMenuItem(
                            child: Text("General Suggestion"),
                            value: SuggestionType.General.getString())
                      ],
                      onChanged: onSuggestionType,
                    ),
                  ),
                ),
                10.vSpace,
                Card(
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type suggestion here",
                        border: InputBorder.none,
                      ),
                      controller: suggestionBodyController,
                      onChanged: onSuggestionBody,
                      maxLines: null,
                    ),
                  ),
                ),
                SizedBox(height: 60,)
              ],
            ),
          )),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: MyActionButton(label: "Suggest", onSubmit: onSubmit),
        )
      ],
    );
  }
}
