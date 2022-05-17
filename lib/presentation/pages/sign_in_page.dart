import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/sign_in_controller.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';
import 'package:yarn_bazaar/presentation/views/sign_in_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class SignInPage extends StatelessWidget {
  static const route = '/signInPage';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<SignInViewModel, SignInController>(
        create: () => SignInController(context),
        builder: (context, controller, signInViewModel) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white10,
                leading: PopButton(onPop: controller.onPop),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.phone_outlined),
                    onPressed: controller.onCall,
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/yarn.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: SignInView(
                        signInViewModel: signInViewModel!,
                        onPhoneNumber: controller.onPhoneNumber,
                        onPassword: controller.onPassword,
                        onShowHidePassword: controller.onShowHidePassword,
                        onForgotPassword: controller.onForgotPassword,
                        onLogin: controller.onLogin,
                      ),
                    ),
                    const Text("Don't have an account?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Click '),
                        TextButton(
                          onPressed: controller.onRegister,
                          child: const Text('here'),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        const Text(' to register')
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
