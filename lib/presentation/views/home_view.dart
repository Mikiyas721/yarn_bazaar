import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';

class HomeViewAppBar extends StatelessWidget {
  final VoidCallback onNotification;

  const HomeViewAppBar({
    Key? key,
    required this.onNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: SearchField(onDiscardText: () {}),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: onNotification,
            )
          ],
        ),
      ],
    );
  }
}

class HomeViewBody extends StatelessWidget {
  final VoidCallback onPostYarnRequirement;
  final VoidCallback onCategories;
  final VoidCallback onWatchList;

  const HomeViewBody({
    Key? key,
    required this.onPostYarnRequirement,
    required this.onCategories,
    required this.onWatchList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        OutlinedButton.icon(
          icon: const Icon(Icons.email_outlined),
          label: const Text('Post Yarn Requirement'),
          onPressed: onPostYarnRequirement,
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
