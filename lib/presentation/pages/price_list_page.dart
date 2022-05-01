import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/models/prices_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/price_list_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class PriceListPage extends StatelessWidget {
  const PriceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Text('All'),
      Text('Cotton'),
      Text('Texturise'),
      Text('PSF'),
      Text('PC'),
      Text('PV'),
      Text('Viscose'),
      Text('CP'),
      Text('Linen'),
      Text('Modal'),
      Text('Rayon'),
      Text('Fancy'),
      Text('Worsted Wool'),
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
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.only(bottom: 10, right: 20, left: 20),
              tabs: tabs,
              indicatorColor: context.primaryColor,
            ),
          ),
          body: TabBarView(
            children: List.filled(
                tabs.length,
                RefreshIndicator(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: PriceListView(
                      pricesViewModel: PricesViewModel.defaults(),
                      onReload: () {},
                      onWatchlist: (PriceViewModel viewModel) {},
                      onCompare: (PriceViewModel viewModel) {},
                      onDetail: (PriceViewModel viewModel) {
                        Navigator.pushNamed(context, '/priceListDetailPage',
                            arguments: viewModel);
                      },
                      onShare: (PriceViewModel viewModel) {},
                    ),
                  ),
                  onRefresh: () async {},
                )),
          ),
          bottomNavigationBar: BottomNavigationBarView(
            bottomNavigationBarViewModel:
                BottomNavigationBarViewModel(selectedItemIndex: 1),
          ),
        ));
  }
}
