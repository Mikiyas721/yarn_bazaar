import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/buyer_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class BuyerProfileView extends StatelessWidget {
  final BuyerProfileViewModel buyerProfileViewModel;
  final Color color;

  const BuyerProfileView({
    Key? key,
    required this.buyerProfileViewModel,
    required this.color,
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
          color: color,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(buyerProfileViewModel.imageUrl),
                radius: 28,
              ),
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
          color: Colors.white,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 40,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('Post Yarn Requirement'),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      primary: color,
                      textStyle: TextStyle(
                        color: color,
                      ),
                      minimumSize: Size.infinite,
                      side: BorderSide(
                        width: 0.7,
                        color: color,
                      ),
                    ),
                  ),
                ),
                LabeledIconButton(
                  iconData: Icons.email_outlined,
                  label: 'My Yarn Requirements',
                  iconColor: color,
                  onTap: () {},
                ),
                LabeledIconButton(
                    iconData: Icons.question_answer_outlined,
                    label: 'My Inquiries',
                    iconColor: color,
                    onTap: () {}),
                LabeledIconButton(
                    iconData: Icons.shopping_cart_outlined,
                    label: 'My Orders',
                    iconColor: color,
                    onTap: () {}),
                LabeledIconButton(
                    iconData: Icons.book_outlined,
                    label: 'My Address List',
                    iconColor: color,
                    onTap: () {}),
                LabeledIconButton(
                    iconData: Icons.article_outlined,
                    label: 'My Activity Log',
                    iconColor: color,
                    onTap: () {}),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              15.vSpace,
              NavigateButton(label: 'My Product Listing Plan', onTap: () {}),
              15.vSpace,
              NavigateButton(
                  label: 'Suggest a Company/Yarn/Feature', onTap: () {}),
            ],
          ),
        )
      ],
    );
  }
}
