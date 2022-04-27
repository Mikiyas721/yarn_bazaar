import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';

class BottomNavigationBarView extends StatelessWidget {
  final BottomNavigationBarViewModel bottomNavigationBarViewModel;
  final void Function(int selectedIndex) onItemSelected;

  const BottomNavigationBarView({
    Key? key,
    required this.bottomNavigationBarViewModel,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on), label: 'Price List'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Directory'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Watchlist'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Profile'),
      ],
      currentIndex: bottomNavigationBarViewModel.selectedItemIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: onItemSelected,
    );
  }
}
