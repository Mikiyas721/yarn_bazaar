import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';

class BottomNavigationController extends BlocViewModelController<BottomNavigationBloc,
    BottomNavigationEvent, BottomNavigationState, BottomNavigationBarViewModel> {
  BottomNavigationController(BuildContext context)
      : super(context, getIt.get<BottomNavigationBloc>(), false);

  @override
  BottomNavigationBarViewModel mapStateToViewModel(BottomNavigationState s) {
    return BottomNavigationBarViewModel(selectedItemIndex: s.activeIndex);
  }

  switchTo(int index){
    bloc.add(BottomNavigationSelectedIndexChangedEvent(index));
  }

  onNavigate(int index) {
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
