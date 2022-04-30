import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/pages/add_yarn_requirement_page.dart';
import 'package:yarn_bazaar/presentation/pages/auth_page.dart';
import 'package:yarn_bazaar/presentation/pages/categories_page.dart';
import 'package:yarn_bazaar/presentation/pages/composed_yarn_page.dart';
import 'package:yarn_bazaar/presentation/pages/directory_detail_page.dart';
import 'package:yarn_bazaar/presentation/pages/directory_page.dart';
import 'package:yarn_bazaar/presentation/pages/home_page.dart';
import 'package:yarn_bazaar/presentation/pages/input_selection_page.dart';
import 'package:yarn_bazaar/presentation/pages/price_list_detail_page.dart';
import 'package:yarn_bazaar/presentation/pages/price_list_page.dart';
import 'package:yarn_bazaar/presentation/pages/profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_in_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_up_page.dart';
import 'package:yarn_bazaar/presentation/pages/splash_page.dart';
import 'package:yarn_bazaar/presentation/pages/watchlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yarn Bazaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorDark: const Color(0xFFFF5110),
          primaryColor: const Color(0xFFFF9F10),
          secondaryHeaderColor: const Color(0xFF2E80EC),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white38,
            iconTheme: IconThemeData(color: Colors.grey),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.black),),
          colorScheme: Theme.of(context)
          .colorScheme
          .copyWith(primary: const Color(0xFFFF9F10))
      ),
      initialRoute: '/homePage',
      routes: routes,
      onGenerateRoute: (RouteSettings settings){
        return null;
      },
    );
  }
}

final routes = {
  '/': (BuildContext context) => const SplashPage(),
  '/addYarnRequirementPage': (BuildContext context) =>  const AddYarnRequirementPage(),
  '/authPage': (BuildContext context) => const AuthPage(),
  '/categoriesPage': (BuildContext context) => const CategoriesPage(),
  '/composedYarnPage': (BuildContext context) => const ComposedYarnPage(),
  '/directoryDetailPage': (BuildContext context) => const DirectoryDetailPage(),
  '/directoryPage': (BuildContext context) => const DirectoryPage(),
  '/homePage': (BuildContext context) => const HomePage(),
  '/inputSelectionPage': (BuildContext context) => const InputSelectionPage(),
  '/priceListDetailPage': (BuildContext context) => const PriceListDetailPage(),
  '/priceListPage': (BuildContext context) => const PriceListPage(),
  '/profilePage': (BuildContext context) => const ProfilePage(),
  '/signInPage': (BuildContext context) => const SignInPage(),
  '/signUpPage': (BuildContext context) => const SignUpPage(),
  '/watchlistPage': (BuildContext context) => const WatchlistPage(),
};
