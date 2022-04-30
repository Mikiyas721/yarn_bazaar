import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Text('Products'),
      Text('Mills'),
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
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/avatar.png', height: 60),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Watchlist'),
                    ),
                  )
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(
                tabs: tabs,
                labelPadding: const EdgeInsets.only(bottom: 10),
                indicatorColor: context.primaryColor,
              )),
          body: TabBarView(
            children:
                List.filled(tabs.length, const Center(child: Text('No Watchlist found'))),
          ),
          bottomNavigationBar: BottomNavigationBarView(
            bottomNavigationBarViewModel:
                BottomNavigationBarViewModel(selectedItemIndex: 3),
          ),
        ));
  }
}
