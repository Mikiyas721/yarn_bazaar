import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/pages/add_yarn_requirement_page.dart';
import 'package:yarn_bazaar/presentation/pages/auth_page.dart';
import 'package:yarn_bazaar/presentation/pages/categories_page.dart';
import 'package:yarn_bazaar/presentation/pages/composed_yarn_page.dart';
import 'package:yarn_bazaar/presentation/pages/user_detail_page.dart';
import 'package:yarn_bazaar/presentation/pages/directory_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_bank_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_basic_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_business_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_password_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/home_page.dart';
import 'package:yarn_bazaar/presentation/pages/input_selection_page.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/presentation/pages/price_list_page.dart';
import 'package:yarn_bazaar/presentation/pages/privacy_policy_page.dart';
import 'package:yarn_bazaar/presentation/pages/profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_in_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_up_page.dart';
import 'package:yarn_bazaar/presentation/pages/splash_page.dart';
import 'package:yarn_bazaar/presentation/pages/terms_and_conditions_page.dart';
import 'package:yarn_bazaar/presentation/pages/watchlist_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpDependencies();
  runApp(const YarnBazaar());
}

class YarnBazaar extends StatelessWidget {
  const YarnBazaar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yarn Bazaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: const Color(0xFFFF5110),
        primaryColor: const Color(0xFFFF9F10),
        secondaryHeaderColor: const Color(0xFF3EA0CC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: const Color(0xFFFF9F10),
          unselectedLabelColor: Colors.grey,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: const Color(0xFFFF9F10)),
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}

final routes = {
  '/': (BuildContext context) => const SplashPage(),
  '/addYarnRequirementPage': (BuildContext context) => const AddYarnRequirementPage(),
  '/authPage': (BuildContext context) => const AuthPage(),
  '/categoriesPage': (BuildContext context) => const CategoriesPage(),
  '/composedYarnPage': (BuildContext context) => const ComposedYarnPage(),
  '/editBankDetailsPage': (BuildContext context) => const EditBankDetailsPage(),
  '/editBasicProfilePage': (BuildContext context) => const EditBasicProfilePage(),
  '/editBusinessDetailsPage': (BuildContext context) => const EditBusinessDetailPage(),
  '/editPasswordPage': (BuildContext context) => const EditPasswordPage(),
  '/editProfilePage': (BuildContext context) => const EditProfilePage(),
  '/directoryPage': (BuildContext context) => const DirectoryPage(),
  '/homePage': (BuildContext context) => const HomePage(),
  '/inputSelectionPage': (BuildContext context) => const InputSelectionPage(),
  '/priceListPage': (BuildContext context) => const PriceListPage(),
  '/privacyPolicyPage': (BuildContext context) => const PrivacyPolicyPage(),
  '/profilePage': (BuildContext context) => const ProfilePage(),
  '/signInPage': (BuildContext context) => const SignInPage(),
  '/signUpPage': (BuildContext context) => const SignUpPage(),
  '/termsAndConditionsPage': (BuildContext context) => const TermsAndConditionsPage(),
  '/userDetailPage': (BuildContext context) => const UserDetailPage(),
  '/watchlistPage': (BuildContext context) => const WatchlistPage(),
  '/yarnDetailPage': (BuildContext context) => const YarnDetailPage(),
};
