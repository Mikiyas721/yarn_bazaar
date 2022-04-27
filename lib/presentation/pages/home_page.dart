import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBarView(
              bottomNavigationBarViewModel:
                  BottomNavigationBarViewModel.defaults(),
              onItemSelected: (int selectedItem) {}),
        ));
  }
}
