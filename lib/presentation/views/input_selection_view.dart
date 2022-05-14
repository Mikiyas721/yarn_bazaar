import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/input_selection_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class InputSelectionView extends StatelessWidget {
  final InputSelectionViewModel inputSelectionViewModel;
  final Function(int optionIndex) onOptionSelect;
  final VoidCallback onSubmit;

  const InputSelectionView({
    Key? key,
    required this.inputSelectionViewModel,
    required this.onOptionSelect,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final emptyCircle = Container(
        height: 0,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          shape: BoxShape.circle,
        ));
    final selectedIndicator = Icon(
      Icons.check_circle,
      color: context.primaryColor,
      size: 20,
    );
    return inputSelectionViewModel.errorMessage != null
        ? Center(child: Text(inputSelectionViewModel.errorMessage!))
        : Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(inputSelectionViewModel.options[index]),
                        onTap: () {
                          onOptionSelect(index);
                        },
                        trailing: inputSelectionViewModel.isMultiSelect
                            ? (inputSelectionViewModel.selectedOptions![index]
                                ? selectedIndicator
                                : emptyCircle)
                            : (inputSelectionViewModel.selectedOptionIndex == index
                                ? selectedIndicator
                                : emptyCircle),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 1);
                    },
                    itemCount: inputSelectionViewModel.options.length)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyActionButton(
                label: 'Ok',
                onSubmit: onSubmit,
              ),
            )
          ]);
  }
}
