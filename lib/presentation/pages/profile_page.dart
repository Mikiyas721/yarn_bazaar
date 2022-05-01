import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/buyer_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/models/seller_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/buyer_profile_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/seller_profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/profile_selection_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  int selectedProfileIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabColors = [context.primaryColor, context.secondaryHeaderColor];
    return Scaffold(
      drawer: DrawerView(
        drawerViewModel: DrawerViewModel.defaults(),
        onEditAccount: () {},
        onLogout: () {},
        onDrawerItemClicked: (int itemIndex) {},
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tabColors[selectedProfileIndex],
        title: ProfileSelectionButton(
          firstTabIsSelected: selectedProfileIndex == 0,
          tabColors: tabColors,
          onSelect: (bool selectedFirstTab) {
            if (selectedFirstTab && selectedProfileIndex == 1) {
              setState(() {
                selectedProfileIndex = 0;
              });
            } else if (!selectedFirstTab && selectedProfileIndex == 0) {
              setState(() {
                selectedProfileIndex = 1;
              });
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: selectedProfileIndex == 0
          ? BuyerProfileView(
              buyerProfileViewModel: BuyerProfileViewModel.defaults(),
              color: tabColors[0],
            )
          : SellerProfileView(
              sellerProfileViewModel: SellerProfileViewModel.defaults(),
              color: tabColors[1],
            ),
      bottomNavigationBar: BottomNavigationBarView(
        bottomNavigationBarViewModel:
            BottomNavigationBarViewModel(selectedItemIndex: 4),
      ),
    );
  }
}
