import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ApplyForFinancePage extends StatelessWidget {
  static const route = '/applyForFinancePage';

  const ApplyForFinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("Apply for Finance / Credit"),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "APPLY ONLINE",
                  style: context.titleMedium,
                ),
                15.vSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Use our yarn finance facility to ensure cash payment for yarn purchases and get cash discount (CD) benefit",
                    textAlign: TextAlign.center,
                    style: context.labelMedium,
                  ),
                ),
                30.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: MyActionButton(
                        label: 'Request Call Back',
                        onSubmit: () {},
                      ),
                    ),
                    15.hSpace,
                    SizedBox(
                      width: size.width * 0.4,
                      child: MyActionButton(
                        label: 'Apply',
                        onSubmit: () {},
                      ),
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
