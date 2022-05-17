import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class CategoriesPage extends StatelessWidget {
  static const route = '/categoriesPage';
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Categories'),
      ),
    );
  }
}
