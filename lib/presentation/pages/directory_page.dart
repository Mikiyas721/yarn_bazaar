import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/all_users_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/bottom_navigation_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/drawer_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/directory_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

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
                tabs: tabs,
                labelPadding: const EdgeInsets.only(bottom: 10),
                indicatorColor: context.primaryColor,
              )),
          body: TabBarView(
            children: [
              ViewModelBuilder.withController<UsersViewModel, AllUsersController>(
                  create: () => AllUsersController(context),
                  builder: (context, controller, usersViewModel) {
                    return RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: DirectoriesView(
                          directoriesViewModel: usersViewModel!,
                          onReload: controller.onReload,
                          onWatchlist: controller.onWatchlist,
                          onDetail: controller.onDetail,
                          onShare: controller.onShare,
                        ),
                      ),
                      onRefresh: controller.onRefresh,
                    );
                  }),
              ViewModelBuilder.withController<UsersViewModel, AllUsersController>(
                  create: () => AllUsersController(context),
                  builder: (context, controller, usersViewModel) {
                    return RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: DirectoriesView(
                          directoriesViewModel: usersViewModel!,
                          onReload: controller.onReload,
                          onWatchlist: controller.onWatchlist,
                          onDetail: controller.onDetail,
                          onShare: controller.onShare,
                        ),
                      ),
                      onRefresh: controller.onRefresh,
                    );
                  }),
              ViewModelBuilder.withController<UsersViewModel, AllUsersController>(
                  create: () => AllUsersController(context),
                  builder: (context, controller, usersViewModel) {
                    return RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: DirectoriesView(
                          directoriesViewModel: usersViewModel!,
                          onReload: controller.onReload,
                          onWatchlist: controller.onWatchlist,
                          onDetail: controller.onDetail,
                          onShare: controller.onShare,
                        ),
                      ),
                      onRefresh: controller.onRefresh,
                    );
                  }),
              ViewModelBuilder.withController<UsersViewModel, AllUsersController>(
                  create: () => AllUsersController(context),
                  builder: (context, controller, usersViewModel) {
                    return RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: DirectoriesView(
                          directoriesViewModel: usersViewModel!,
                          onReload: controller.onReload,
                          onWatchlist: controller.onWatchlist,
                          onDetail: controller.onDetail,
                          onShare: controller.onShare,
                        ),
                      ),
                      onRefresh: controller.onRefresh,
                    );
                  })
              //TODO replace with the right controller for each tab
            ],
          ),
          bottomNavigationBar: ViewModelBuilder.withController<BottomNavigationBarViewModel,
                  BottomNavigationController>(
              create: () => BottomNavigationController(context),
              onInit: (controller) => controller.switchTo(2),
              builder: (context, controller, viewModel) {
                return BottomNavigationBarView(
                  bottomNavigationBarViewModel: viewModel!,
                  onItemSelected: controller.onNavigate,
                );
              }),
        ));
  }
}
