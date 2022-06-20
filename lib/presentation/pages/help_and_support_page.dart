import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/help_and_support_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class HelpAndSupportPage extends StatelessWidget {
  static const route = '/helpAndSupportPage';

  const HelpAndSupportPage({Key? key}) : super(key: key);

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
                10.vSpace,
                NavigateButton(
                  label: "Contact Us",
                  onTap: controller.onContactUs,
                ),
                Divider(height: 1),
                NavigateButton(
                  label: "FAQ",
                  onTap: controller.onFAQ,
                ),
                Divider(height: 1),
                NavigateButton(
                  label: "Help/How to",
                  onTap: controller.onHelpHowTo,
                ),
                Divider(height: 1),
                NavigateButton(
                  label: "Privacy Policy",
                  onTap: controller.onPrivacyPolicy,
                ),
                Divider(height: 1),
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
