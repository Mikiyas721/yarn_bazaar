import 'package:flutter/widgets.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';

class ComposedYarnView extends StatelessWidget {
  final ComposedYarnViewModel composedYarnViewModel;
  final VoidCallback onPostYarn;

  const ComposedYarnView({
    Key? key,
    required this.composedYarnViewModel,
    required this.onPostYarn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: MyActionButton(
        label: 'POST YARN REQUIREMENT',
        onSubmit: onPostYarn,
        isLoading: composedYarnViewModel.isAdding,
      ),
    );
  }
}
