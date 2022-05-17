import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/pages/add_yarn_requirement_page.dart';
import 'package:yarn_bazaar/presentation/pages/price_list_page.dart';
import 'package:yarn_bazaar/presentation/pages/watchlist_page.dart';

class HomeController extends ControllerWithOutBloc {
  HomeController(BuildContext context) : super(context);

  onNotification() {}

  onPostYarnRequirement() {
    Navigator.pushNamed(context, AddYarnRequirementPage.route);
  }

  onCategories() {
    Navigator.pushReplacementNamed(context, PriceListPage.route);
  }

  onWatchlist() {
    Navigator.pushReplacementNamed(context, WatchlistPage.route);
  }
}
