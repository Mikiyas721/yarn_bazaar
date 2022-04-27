import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/yarn_background.jpg'),
              fit: BoxFit.cover)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/yarn_logo.jpg'),
        Image.asset('assets/images/yarn.jpg')
      ]),
    );
  }
}
