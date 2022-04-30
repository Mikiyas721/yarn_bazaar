import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 35, bottom: 20),
              decoration: BoxDecoration(color: context.primaryColor),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined),
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(drawerViewModel.imageUrl),
                            radius: 28,
                          ),
                        ),
                        Text(
                          drawerViewModel.username,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          drawerViewModel.workPlace,
                          style: const TextStyle(color: Colors.white),
                        )
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
                  dense: true,
                  leading: Icon(drawerItems[index]['icon'] as IconData),
                  title: Text(drawerItems[index]['label'] as String),
                  onTap: () {
                    onDrawerItemClicked(index);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
                indent: 20,
              ),
              itemCount: 8,
            ),
            const Divider(
              height: 1,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(drawerViewModel.workPlace,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: TextButton.icon(
                style:
                    TextButton.styleFrom(backgroundColor: context.primaryColor),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Log Out',
                    style: TextStyle(color: Colors.white)),
                onPressed: onLogout,
              ),
            ),
            const Text(
              '(Version 2.0)',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
