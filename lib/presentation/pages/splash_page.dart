import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/yarn_background.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              bottom: 10,
            ),
            child: Image.asset(
              'assets/yarn_logo.jpg',
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              'assets/images/yarn.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
