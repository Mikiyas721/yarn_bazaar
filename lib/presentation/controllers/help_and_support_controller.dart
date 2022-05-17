import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/pages/privacy_policy_page.dart';
import 'package:yarn_bazaar/presentation/pages/terms_and_conditions_page.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class HelpAndSupportController extends ControllerWithOutBloc with ShortMessageMixin {
  HelpAndSupportController(BuildContext context) : super(context);

  onContactUs() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Contact Us",
              style: TextStyle(
                color: context.primaryColor,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyActionButton(
                  label: "REQUEST CALL BACK",
                  onSubmit: () {},
                ),
                5.vSpace,
                MyActionButton(
                  label: "CALL NOW",
                  onSubmit: () {},
                ),
                5.vSpace,
                MyActionButton(
                  label: "WHATSAPP",
                  onSubmit: () {},
                ),
                10.vSpace,
                Row(
                  children: [
                    Text("Email - "),
                    InkWell(
                      child: Text("your email here"),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
            actions: null,
          );
        });
  }

  onFAQ() {
    toastInformation("Feature not available");
  }

  onHelpHowTo() {
    toastInformation("Feature not available");
  }

  onPrivacyPolicy() {
    Navigator.pushNamed(context, PrivacyPolicyPage.route);
  }

  onTermsOfService() {
    Navigator.pushNamed(context, TermsAndConditionsPage.route);
  }
}
