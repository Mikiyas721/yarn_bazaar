import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/pages/about_us_page.dart';
import 'package:yarn_bazaar/presentation/pages/add_yarn_requirement_page.dart';
import 'package:yarn_bazaar/presentation/pages/apply_for_finance_page.dart';
import 'package:yarn_bazaar/presentation/pages/auth_page.dart';
import 'package:yarn_bazaar/presentation/pages/categories_page.dart';
import 'package:yarn_bazaar/presentation/pages/composed_yarn_page.dart';
import 'package:yarn_bazaar/presentation/pages/forgot_password_page.dart';
import 'package:yarn_bazaar/presentation/pages/help_and_support_page.dart';
import 'package:yarn_bazaar/presentation/pages/news_page.dart';
import 'package:yarn_bazaar/presentation/pages/reset_password_page.dart';
import 'package:yarn_bazaar/presentation/pages/suggestion_page.dart';
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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          titleTextStyle: GoogleFonts.poppins(fontSize: 22, color: Colors.black),
          centerTitle: true,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: const Color(0xFFFF9F10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.sourceSansPro(color: Colors.white, fontSize: 16),
        )),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 12),
          labelStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          textStyle: GoogleFonts.montserrat(fontSize: 14),
        )),
        primaryColor: const Color(0xFFFF9F10),
        primaryColorDark: const Color(0xFFFF5110),
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: const Color(0xFF3EA0CC),
        tabBarTheme: TabBarTheme(
          labelColor: const Color(0xFFFF9F10),
          unselectedLabelColor: Colors.grey,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(fontSize: 22),
          titleMedium: GoogleFonts.poppins(fontSize: 18),
          titleSmall: GoogleFonts.poppins(fontSize: 14),
          labelLarge: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 13),
          labelMedium: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 12),
          labelSmall: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 11),
          bodyLarge: GoogleFonts.montserrat(fontSize: 16),
          bodyMedium: GoogleFonts.montserrat(fontSize: 14),
          bodySmall: GoogleFonts.montserrat(fontSize: 12),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: GoogleFonts.montserrat(fontSize: 14),
        )),
      ),
      initialRoute: SplashPage.route,
      routes: routes,
    );
  }
}

final routes = {
  SplashPage.route: (BuildContext context) => const SplashPage(),
  AboutUsPage.route: (BuildContext context) => const AboutUsPage(),
  AddYarnRequirementPage.route: (BuildContext context) => const AddYarnRequirementPage(),
  ApplyForFinancePage.route: (BuildContext context) => const ApplyForFinancePage(),
  AuthPage.route: (BuildContext context) => const AuthPage(),
  CategoriesPage.route: (BuildContext context) => const CategoriesPage(),
  ComposedYarnPage.route: (BuildContext context) => const ComposedYarnPage(),
  DirectoryPage.route: (BuildContext context) => const DirectoryPage(),
  EditBankDetailsPage.route: (BuildContext context) => const EditBankDetailsPage(),
  EditBasicProfilePage.route: (BuildContext context) => const EditBasicProfilePage(),
  EditBusinessDetailPage.route: (BuildContext context) => const EditBusinessDetailPage(),
  EditPasswordPage.route: (BuildContext context) => const EditPasswordPage(),
  EditProfilePage.route: (BuildContext context) => const EditProfilePage(),
  ForgotPasswordPage.route: (BuildContext context) => const ForgotPasswordPage(),
  HelpAndSupportPage.route: (BuildContext context) => const HelpAndSupportPage(),
  HomePage.route: (BuildContext context) => const HomePage(),
  InputSelectionPage.route: (BuildContext context) => const InputSelectionPage(),
  NewsPage.route: (BuildContext context) => const NewsPage(),
  PriceListPage.route: (BuildContext context) => const PriceListPage(),
  PrivacyPolicyPage.route: (BuildContext context) => const PrivacyPolicyPage(),
  ProfilePage.route: (BuildContext context) => const ProfilePage(),
  ResetPasswordPage.route: (BuildContext context) => const ResetPasswordPage(),
  SignInPage.route: (BuildContext context) => const SignInPage(),
  SignUpPage.route: (BuildContext context) => const SignUpPage(),
  SuggestionPage.route: (BuildContext context) => const SuggestionPage(),
  TermsAndConditionsPage.route: (BuildContext context) => const TermsAndConditionsPage(),
  UserDetailPage.route: (BuildContext context) => const UserDetailPage(),
  WatchlistPage.route: (BuildContext context) => const WatchlistPage(),
  YarnDetailPage.route: (BuildContext context) => const YarnDetailPage(),
};
