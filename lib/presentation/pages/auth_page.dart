import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/images/yarn.jpg',
                width: 250,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.15),
              child: CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                      width: 280,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                            'assets/images/carousel/${index + 1}.jpg'),
                        fit: BoxFit.contain,
                      )));
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 500,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x55000000),
                  blurRadius: 0.2,
                  offset: Offset(0.1, 0.1),
                  blurStyle: BlurStyle.outer,
                )
              ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('New User'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: MyActionButton(
                      onSubmit: () {
                        //TODO move to controller
                        Navigator.pushNamed(context, '/signUpPage');
                      },
                      label: 'REGISTER FREE',
                    ),
                  ),
                  const Text('Existing User'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 15),
                    child: MyActionButton(
                      onSubmit: () {
                        Navigator.pushNamed(context, '/signInPage');
                      },
                      label: 'LOGIN',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
