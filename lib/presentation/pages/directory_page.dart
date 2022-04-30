import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/directory_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Text('All'),
      Text('Mill'),
      Text('Traders'),
      Text('Brokers'),
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          drawer: DrawerView(
            drawerViewModel: DrawerViewModel.defaults(),
            onEditAccount: () {},
            onLogout: () {},
            onDrawerItemClicked: (int itemIndex) {},
          ),
          appBar: AppBar(
              title: SearchField(
                onDiscardText: () {},
                onTap: () {},
                onChanged: (String input) {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(
                tabs: tabs,
                labelPadding: const EdgeInsets.only(bottom: 10),
                indicatorColor: context.primaryColor,
              )),
          body: TabBarView(
            children: List.filled(
                tabs.length,
                RefreshIndicator(
                    child: DirectoriesView(
                      directoriesViewModel: DirectoriesViewModel.defaults(),
                      onReload: () {},
                    ),
                    onRefresh: () async {})),
          ),
          bottomNavigationBar: BottomNavigationBarView(
            bottomNavigationBarViewModel:
                BottomNavigationBarViewModel(selectedItemIndex: 2),
          ),
        ));
  }
}
