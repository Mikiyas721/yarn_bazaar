import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/all_yarns_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/bottom_navigation_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/drawer_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/yarn_list_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

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
          drawer: ViewModelBuilder.withController<DrawerViewModel, MyDrawerController>(
              create: () => MyDrawerController(context),
              builder: (context, controller, viewModel) {
                return DrawerView(
                  drawerViewModel: viewModel!,
                  onEditAccount: controller.onEditAccount,
                  onLogout: controller.onLogout,
                  onDrawerItemClicked: controller.onDrawerItemClicked,
                );
              }),
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
              labelPadding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
              tabs: tabs,
              indicatorColor: context.primaryColor,
            ),
          ),
          body: TabBarView(children: [
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                })
            //TODO replace with the right corresponding controllers
          ]),
          bottomNavigationBar: ViewModelBuilder.withController<BottomNavigationBarViewModel,
                  BottomNavigationController>(
              create: () => BottomNavigationController(context),
              onInit: (controller) => controller.switchTo(1),
              builder: (context, controller, viewModel) {
                return BottomNavigationBarView(
                  bottomNavigationBarViewModel: viewModel!,
                  onItemSelected: controller.onNavigate,
                );
              }),
        ));
  }
}
