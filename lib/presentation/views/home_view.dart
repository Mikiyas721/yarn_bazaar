import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onPostYarnRequirement;
  final VoidCallback onCategories;
  final VoidCallback onWatchList;

  const HomeView({
    Key? key,
    required this.onPostYarnRequirement,
    required this.onCategories,
    required this.onWatchList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ListView(
      children: [
        OutlinedButton.icon(
          icon: const Icon(Icons.email_outlined),
          label: const Text('Post Yarn Requirement'),
          onPressed: onPostYarnRequirement,
          style: OutlinedButton.styleFrom(minimumSize: Size.infinite),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LabeledIconButton(
              iconData: Icons.category,
              label: 'Categories',
              iconColor: primaryColor,
              filled: true,
              onTap: onCategories,
            ),
            LabeledIconButton(
              iconData: Icons.favorite_border,
              label: 'Watchlist',
              iconColor: primaryColor,
              filled: true,
              onTap: onWatchList,
            ),
          ],
        )
      ],
    );
  }
}
