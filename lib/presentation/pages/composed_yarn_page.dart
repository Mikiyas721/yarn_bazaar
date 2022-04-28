import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/presentation/views/composed_yarn_view.dart';

class ComposedYarnPage extends StatelessWidget {
  const ComposedYarnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as ComposedYarnViewModel;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text('Post Yarn Requirement'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ComposedYarnView(composedYarnViewModel: argument),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              child: const Text('POST YARN REQUIREMENT'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
