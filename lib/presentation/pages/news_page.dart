import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class NewsPage extends StatelessWidget {
  static const route = '/newsPage';
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: Text("News"),
      ),
      body: Center(child: Text("Feature Unavailable")),
    );
  }
}
