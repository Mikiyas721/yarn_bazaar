import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/domain/use_cases/clear_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/get_file_download_link.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/about_us_page.dart';
import 'package:yarn_bazaar/presentation/pages/add_yarn_requirement_page.dart';
import 'package:yarn_bazaar/presentation/pages/apply_for_finance_page.dart';
import 'package:yarn_bazaar/presentation/pages/auth_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/help_and_support_page.dart';
import 'package:yarn_bazaar/presentation/pages/home_page.dart';
import 'package:yarn_bazaar/presentation/pages/news_page.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerController
    extends BlocViewModelController<SplashBloc, SplashEvent, SplashState, DrawerViewModel>
    with ShortMessageMixin {
  MyDrawerController(BuildContext context) : super(context, getIt.get<SplashBloc>(), true);

  @override
  DrawerViewModel mapStateToViewModel(SplashState s) {
    return DrawerViewModel(
      imageUrl: s.appUser.fold(
          () => null,
          (a) => a.imageUrl == null
              ? null
              : getIt.get<GetFileDownloadLink>().execute('user', a.imageUrl!)),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
    );
  }

  onEditAccount() {
    Navigator.pushNamed(context, EditProfilePage.route);
  }

  onLogout() async {
    final clearSavedResponse = await getIt.get<ClearLoggedInUser>().execute();
    if (clearSavedResponse) {
      bloc.add(SplashAppUserChangedEvent(none()));
      Navigator.pushNamedAndRemoveUntil(context, AuthPage.route, (route) => false);
    } else {
      toastError("Unable to clear cache");
    }
  }

  onDrawerItemClicked(int itemIndex) {
    if (itemIndex == 0)
      onHome();
    else if (itemIndex == 1)
      onPostYarnRequirement();
    else if (itemIndex == 2)
      onApplyForFinance();
    else if (itemIndex == 3)
      onNews();
    else if (itemIndex == 4)
      onAdvertiseWithUs();
    else if (itemIndex == 5)
      onShareApp();
    else if (itemIndex == 6)
      onHelpAndSupport();
    else if (itemIndex == 7) onAboutUs();
  }

  onHome() {
    Navigator.pushNamed(context, HomePage.route);
  }

  onPostYarnRequirement() {
    Navigator.pushNamed(context, AddYarnRequirementPage.route);
  }

  onApplyForFinance() {
    Navigator.pushNamed(context, ApplyForFinancePage.route);
  }

  onNews() {
    Navigator.pushNamed(context, NewsPage.route);
  }

  onAdvertiseWithUs() {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Advertise with Us",
              style: TextStyle(
                color: context.primaryColor,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyActionButton(
                  label: "REQUEST CALL BACK",
                  onSubmit: () {
                    //TODO implement
                  },
                ),
                5.vSpace,
                MyActionButton(
                  label: "CALL NOW",
                  onSubmit: () async {
                    Uri phoneNumberUri = Uri(scheme: 'tel', path: '9914601110');
                    bool canCall = await canLaunchUrl(phoneNumberUri);
                    if (canCall) {
                      await launchUrl(phoneNumberUri);
                    } else {
                      Navigator.pop(context);
                      toastError("Unable to open dialer");
                    }
                  },
                ),
                5.vSpace,
                MyActionButton(
                  label: "WHATSAPP",
                  onSubmit: () async {
                    bool launched = await launchUrl(
                        Uri(scheme: 'https', path: 'api.whatsapp.com/send?phone=9914601110'),
                        mode: LaunchMode.externalApplication);
                    if (!launched) toastError("Unable to open whatsapp");
                  },
                ),
                10.vSpace,
                Row(
                  children: [
                    Text("Email - "),
                    TextButton(
                      child: Text(
                        "your email here",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      onPressed: () async {
                        bool launched = await launchUrl(
                          Uri(
                              scheme: 'mailto',
                              path: 'your email here',
                              queryParameters: {'subject': 'Example'}),
                        );
                        if (!launched) toastError("Unable to email");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                )
              ],
            ),
            actions: null,
          );
        });
  }

  onShareApp() {
    Share.share('''
  Live Yarn Rates, Information, Availability and Directory !!
  Download 'The Yarn Bazaar' app.
  https://www.google.com
  ''');
  }

  onHelpAndSupport() {
    Navigator.pushReplacementNamed(context, HelpAndSupportPage.route);
  }

  onAboutUs() {
    Navigator.pushReplacementNamed(context, AboutUsPage.route);
  }
}
