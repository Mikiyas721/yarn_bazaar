import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/home_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: HomeView(
        onPostYarnRequirement: () {},
        onCategories: () {},
        onWatchList: () {},
      ),
      bottomNavigationBar: BottomNavigationBarView(
          bottomNavigationBarViewModel:
              BottomNavigationBarViewModel(selectedItemIndex: 0),
          onItemSelected: (int selectedItem) {}),
    );
  }
}
