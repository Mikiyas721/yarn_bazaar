import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class TermsAndConditionsPage extends StatelessWidget {
  static const route = '/termsAndConditionsPage';
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: Text("Terms and Conditions"),
      ),
    );
  }
}
