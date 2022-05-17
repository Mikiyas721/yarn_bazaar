import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class AboutUsPage extends StatelessWidget {
  static const route = '/aboutUsPage';
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("About Us"),
      ),
      body: Center(child: Text("About Us Page")),
    );
  }
}
