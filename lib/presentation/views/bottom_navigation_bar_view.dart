import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';

class BottomNavigationBarView extends StatelessWidget {
  final BottomNavigationBarViewModel bottomNavigationBarViewModel;
  final void Function(int selectedIndex)? onItemSelected;

  const BottomNavigationBarView({
    Key? key,
    required this.bottomNavigationBarViewModel,
    this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined), label: 'Price List'),
        BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined), label: 'Directory'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Watchlist'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
      ],
      currentIndex: bottomNavigationBarViewModel.selectedItemIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: onItemSelected ??
          (int index) {
            onNavigate(context, index);
          },
    );
  }

  //TODO move to controller
  onNavigate(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/homePage');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/priceListPage');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/directoryPage');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/watchlistPage');
    } else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/profilePage');
    }
  }
}
