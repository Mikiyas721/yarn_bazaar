import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/yarn.jpg'),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            const Text('New User'),
            ElevatedButton(
                onPressed: () {}, child: const Text('REGISTER FREE')),
            const Text('Existing User'),
            ElevatedButton(onPressed: () {}, child: const Text('LOGIN')),
          ],
        ),
      )
    ]);
  }
}
