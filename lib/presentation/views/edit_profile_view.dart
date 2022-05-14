import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/my_image_view.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';

class EditProfileView extends StatelessWidget {
  final EditProfileViewModel buyerProfileViewModel;
  final VoidCallback onBasicProfile;
  final VoidCallback onBusinessDetails;
  final VoidCallback onBankDetails;
  final VoidCallback onChangePassword;

  const EditProfileView({
    Key? key,
    required this.buyerProfileViewModel,
    required this.onBasicProfile,
    required this.onBusinessDetails,
    required this.onBankDetails,
    required this.onChangePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final percentageWidget = Padding(
      padding: EdgeInsets.only(
        left: ((size.width * 0.6) *
                buyerProfileViewModel.profileCompletedInPercent /
                100) -
            (buyerProfileViewModel.profileCompletedInPercent > 99 ? 36 : 30),
      ),
      child: Text(
        '${buyerProfileViewModel.profileCompletedInPercent.toInt()}%',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
    return Column(
      children: [
        Container(
          color: context.primaryColor,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyCircleAvatar(image: buyerProfileViewModel.imageUrl),
              10.vSpace,
              Text(
                buyerProfileViewModel.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                buyerProfileViewModel.workPlace,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              10.vSpace,
              const Text(
                'Profile Completed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
              Container(
                width: size.width * 0.6,
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: LinearProgressIndicator(
                  value: buyerProfileViewModel.profileCompletedInPercent / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.black26,
                ),
              ),
              SizedBox(
                width: size.width * 0.61,
                child: Row(
                  children: buyerProfileViewModel.profileCompletedInPercent < 10
                      ? [percentageWidget]
                      : [
                          const Text(
                            '0',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          percentageWidget
                        ],
                ),
              ),
              15.vSpace,
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                15.vSpace,
                NavigateButton(
                  label: 'Basic Profile',
                  onTap: onBasicProfile,
                ),
                15.vSpace,
                NavigateButton(
                  label: 'Business Details',
                  onTap: onBusinessDetails,
                ),
                15.vSpace,
                NavigateButton(
                  label: 'Bank Details',
                  onTap: onBankDetails,
                ),
                15.vSpace,
                NavigateButton(
                  label: 'Change Password',
                  onTap: onChangePassword,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
