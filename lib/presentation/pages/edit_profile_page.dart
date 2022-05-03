import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';
import 'package:yarn_bazaar/presentation/models/buyer_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          elevation: 0,
          backgroundColor: context.primaryColor,
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: EditProfileView(
          buyerProfileViewModel: BuyerProfileViewModel.defaults(),
          onBasicProfile: () {
            Navigator.pushNamed(context, '/editBasicProfilePage');
          },
          onBusinessDetails: () {
            Navigator.pushNamed(context, '/editBusinessDetailsPage');
          },
          onBankDetails: () {
            Navigator.pushNamed(context, '/editBankDetailsPage');
          },
          onChangePassword: () {
            Navigator.pushNamed(context, '/editPasswordPage');
          },
        ));
  }
}
