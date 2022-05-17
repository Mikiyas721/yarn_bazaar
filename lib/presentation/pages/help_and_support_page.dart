import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/help_and_support_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class HelpAndSupportPage extends StatelessWidget {
  static const route = '/helpAndSupportPage';
  const HelpAndSupportPage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("Help & Support"),
      ),
      body: ControllerProvider<HelpAndSupportController>(
          create: () => HelpAndSupportController(context),
          builder: (context, controller) {
            return ListView(
              children: [
                NavigateButton(
                  label: "Contact Us",
                  onTap: controller.onContactUs,
                ),
                NavigateButton(
                  label: "FAQ",
                  onTap: controller.onFAQ,
                ),
                NavigateButton(
                  label: "Help/How to",
                  onTap: controller.onHelpHowTo,
                ),
                NavigateButton(
                  label: "Privacy Policy",
                  onTap: controller.onPrivacyPolicy,
                ),
                NavigateButton(
                  label: "Terms of service",
                  onTap: controller.onTermsOfService,
                ),
              ],
            );
          }),
    );
  }
}
