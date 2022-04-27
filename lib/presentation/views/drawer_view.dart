import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';

class DrawerView extends StatelessWidget {
  final DrawerViewModel drawerViewModel;
  final VoidCallback onLogout;
  final VoidCallback onEditAccount;
  final Function(int selectedIndex) onDrawerItemClicked;

  const DrawerView(
      {Key? key,
      required this.drawerViewModel,
      required this.onEditAccount,
      required this.onLogout,
      required this.onDrawerItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      {'icon': Icons.home_outlined, 'label': 'Home'},
      {'icon': Icons.email_outlined, 'label': 'Post Yarn Requirement'},
      {
        'icon': Icons.account_balance_wallet_outlined,
        'label': 'Apply for Finance'
      },
      {'icon': Icons.analytics, 'label': 'News'},
      {'icon': Icons.radio_outlined, 'label': 'Advertise with Us'},
      {'icon': Icons.share, 'label': 'Share App'},
      {'icon': Icons.help_outline, 'label': 'Help & Support'},
      {'icon': Icons.info_outline, 'label': 'About Us'},
    ];
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(drawerViewModel.imageUrl),
                      ),
                      Text(drawerViewModel.username),
                      Text(drawerViewModel.workPlace)
                    ],
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(drawerItems[index]['icon'] as IconData),
                  title: Text(drawerItems[index]['label'] as String),
                  onTap: () {
                    onDrawerItemClicked(index);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: 8),
          Text(drawerViewModel.workPlace),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Log Out'),
            onPressed: onLogout,
          ),
          const Text('(Version 2.0)')
        ],
      ),
    );
  }
}
