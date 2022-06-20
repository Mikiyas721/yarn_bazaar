import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                  onSubmit: () {
                    //TODO Implement
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
                        Uri(scheme: 'https', path: 'api.whatsapp.com/send?phone=+919914601110'),
                        mode: LaunchMode.externalApplication);
                    if (!launched) toastError("Unable to open whatsapp");
                  },
                ),
                10.vSpace,
                Row(
                  children: [
                    Text("Email - "),
                    InkWell(
                      child: Text(
                        "your email here",
                        style: context.labelSmall?.copyWith(color: Colors.lightBlue),
                      ),
                      onTap: () async{
                        bool launched = await launchUrl(
                          Uri(
                              scheme: 'mailto',
                              path: 'your email here',
                              queryParameters: {'subject': 'Example'}),
                        );
                        if (!launched) toastError("Unable to email");
                      },
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
