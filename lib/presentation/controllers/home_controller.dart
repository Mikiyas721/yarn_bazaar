import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';

class HomeController extends ControllerWithOutBloc {
  HomeController(BuildContext context) : super(context);

  onNotification() {}

  onPostYarnRequirement() {
    Navigator.pushNamed(context, '/addYarnRequirementPage');
  }

  onCategories() {}

  onWatchlist() {
    Navigator.pushNamed(context, '/watchlistPage');
  }
}
