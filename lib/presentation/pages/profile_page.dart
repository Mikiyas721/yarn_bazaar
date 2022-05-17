import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/bottom_navigation_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/drawer_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/profile_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/models/profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/profile_selection_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ProfilePage extends StatelessWidget {
  static const route = '/profilePage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabColors = [context.primaryColor, context.secondaryHeaderColor];
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ViewModelBuilder.withController<ProfileViewModel, ProfileController>(
            create: () => ProfileController(context),
            builder: (context, controller, viewModel) {
              return AppBar(
                elevation: 0,
                backgroundColor: tabColors[viewModel!.selectedProfileIndex],
                title: ProfileSelectionButton(
                  firstTabIsSelected: viewModel.selectedProfileIndex == 0,
                  tabColors: tabColors,
                  onSelect: controller.onProfileTypeSelected,
                ),
                actions: [
                  IconButton(
                    onPressed: controller.onEditProfile,
                    icon: const Icon(Icons.edit_outlined),
                    color: Colors.white,
                  ),
                ],
              );
            }),
      ),
      body: ViewModelBuilder.withController<ProfileViewModel, ProfileController>(
          create: () => ProfileController(context),
          builder: (context, controller, viewModel) {
            return ProfileView(
              profileViewModel: viewModel!,
              tabColors: tabColors,
              onBuyerPostYarnRequirement: controller.onBuyerPostYarnRequirement,
              onBuyerYarnRequirements: controller.onBuyerYarnRequirements,
              onBuyerMyInquiries: controller.onBuyerMyInquiries,
              onBuyerMyOrders: controller.onBuyerMyOrders,
              onBuyerMyAddressList: controller.onBuyerMyAddressList,
              onBuyerMyActivityLog: controller.onBuyerMyActivityLog,
              onBuyerMembershipDetail: controller.onBuyerMembershipDetail,
              onBuyerSuggestion: controller.onBuyerSuggestion,
              onSellerYarnRequirements: controller.onSellerYarnRequirements,
              onSellerMyInquiries: controller.onSellerMyInquiries,
              onSellerMyOrders: controller.onSellerMyOrders,
              onSellerMyProductListings: controller.onSellerMyProductListings,
              onSellerMyBrokers: controller.onSellerMyBrokers,
              onSellerMyActivityLog: controller.onSellerMyActivityLog,
              onSellerProductListingPlan: controller.onSellerProductListingPlan,
              onSellerSuggestion: controller.onSellerSuggestion,
            );
          }),
      bottomNavigationBar: ViewModelBuilder.withController<BottomNavigationBarViewModel,
              BottomNavigationController>(
          create: () => BottomNavigationController(context),
          onInit: (controller) => controller.switchTo(4),
          builder: (context, controller, viewModel) {
            return BottomNavigationBarView(
              bottomNavigationBarViewModel: viewModel!,
              onItemSelected: controller.onNavigate,
            );
          }),
    );
  }
}
