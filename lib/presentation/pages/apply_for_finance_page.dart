import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ApplyForFinancePage extends StatelessWidget {
  static const route = '/applyForFinancePage';
  const ApplyForFinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("Apply for Finance / Credit"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("APPLY ONLINE"),
                15.vSpace,
                Text(
                  "Use our yarn finance facility to ensure cash payment for yarn purchases and get cash discount (CD) benefit",
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    MyActionButton(
                      label: 'Request Call Back',
                      onSubmit: () {},
                    ),
                    25.hSpace,
                    MyActionButton(
                      label: 'Apply',
                      onSubmit: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
