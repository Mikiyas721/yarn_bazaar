import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/presentation/views/composed_yarn_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class ComposedYarnPage extends StatelessWidget {
  const ComposedYarnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final argument =
        ModalRoute.of(context)?.settings.arguments as ComposedYarnViewModel;*/

    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Post Yarn Requirement'),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, bottom: 55),
            child: Align(
              alignment: Alignment.topCenter,
              child: ComposedYarnView(
                composedYarnViewModel: ComposedYarnViewModel.defaults(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MyActionButton(
              label: 'POST YARN REQUIREMENT',
              onSubmit: () {},
            ),
          )
        ],
      ),
    );
  }
}
