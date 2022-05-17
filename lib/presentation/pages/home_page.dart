import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/bottom_navigation_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/drawer_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/home_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class HomePage extends StatelessWidget {
  static const route = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControllerProvider(
        create: () => HomeController(context),
        builder: (BuildContext context, HomeController homeController) {
          return Scaffold(
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
              centerTitle: false,
              title: SearchField(
                onDiscardText: () {},
                onTap: () {},
                onChanged: (String input) {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  onPressed: homeController.onNotification,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 45,
                        child: OutlinedButton.icon(
                            icon: const Icon(Icons.email_outlined),
                            label: const Text('Post Yarn Requirement'),
                            onPressed: homeController.onPostYarnRequirement,
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.infinite,
                              side: BorderSide(width: 0.7, color: context.primaryColor),
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabeledIconButton(
                          iconData: Icons.category_outlined,
                          label: 'Categories',
                          iconColor: context.primaryColor,
                          filled: true,
                          onTap: homeController.onCategories,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        LabeledIconButton(
                          iconData: Icons.favorite_border_outlined,
                          label: 'Watchlist',
                          iconColor: context.primaryColor,
                          filled: true,
                          onTap: homeController.onWatchlist,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: ViewModelBuilder.withController<BottomNavigationBarViewModel,
                    BottomNavigationController>(
                create: () => BottomNavigationController(context),
                onInit: (controller) => controller.switchTo(0),
                builder: (context, controller, viewModel) {
                  return BottomNavigationBarView(
                    bottomNavigationBarViewModel: viewModel!,
                    onItemSelected: controller.onNavigate,
                  );
                }),
          );
        });
  }
}
