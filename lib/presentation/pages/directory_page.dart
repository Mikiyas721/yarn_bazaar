import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/directory_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';

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
              title: SearchField(onDiscardText: () {}),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  onPressed: () {},
                )
              ],
              bottom: const TabBar(
                tabs: tabs,
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
              onItemSelected: (int selectedItem) {}),
        ));
  }
}
