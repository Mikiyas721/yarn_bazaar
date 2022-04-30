import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/seller_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class SellerProfileView extends StatelessWidget {
  final SellerProfileViewModel sellerProfileViewModel;
  final Color color;

  const SellerProfileView({
    Key? key,
    required this.sellerProfileViewModel,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final percentageWidget = Padding(
      padding: EdgeInsets.only(
        left: ((size.width * 0.6) *
                sellerProfileViewModel.profileCompletedInPercent /
                100) -
            (sellerProfileViewModel.profileCompletedInPercent > 99 ? 36 : 30),
      ),
      child: Text(
        '${sellerProfileViewModel.profileCompletedInPercent.toInt()}%',
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
                backgroundImage: AssetImage(sellerProfileViewModel.imageUrl),
                radius: 28,
              ),
              10.vSpace,
              Text(
                sellerProfileViewModel.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                sellerProfileViewModel.workPlace,
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
                  value: sellerProfileViewModel.profileCompletedInPercent / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.black26,
                ),
              ),
              SizedBox(
                width: size.width * 0.61,
                child: Row(
                  children: sellerProfileViewModel.profileCompletedInPercent <
                          10
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
                LabeledIconButton(
                  iconData: Icons.email_outlined,
                  label: 'Yarn Requirements',
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
                    label: 'My Products Listings',
                    iconColor: color,
                    onTap: () {}),
                LabeledIconButton(
                    iconData: Icons.people_outline,
                    label: 'My Brokers',
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
