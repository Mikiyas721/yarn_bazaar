import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  static const route = '/';
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ControllerProvider<SplashController>(
            create: () => SplashController(context),
            onInit: (controller) => controller.loadUser(),
            builder: (BuildContext context, SplashController controller) {
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
                        'assets/yarn_logo.png',
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Image.asset(
                        'assets/images/yarn.png',
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
