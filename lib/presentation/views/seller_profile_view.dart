import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/seller_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';

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
          left: size.width *
              sellerProfileViewModel.profileCompletedInPercent /
              100),
      child: Text('${sellerProfileViewModel.profileCompletedInPercent}%'),
    );
    return Column(
      children: [
        Container(
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(sellerProfileViewModel.imageUrl),
              ),
              Text(sellerProfileViewModel.username),
              Text(sellerProfileViewModel.workPlace),
              const Text('Profile Completed'),
              SizedBox(
                width: size.width,
                child: LinearProgressIndicator(
                  value: sellerProfileViewModel.profileCompletedInPercent,
                ),
              ),
              Row(
                children: sellerProfileViewModel.profileCompletedInPercent < 10
                    ? [percentageWidget]
                    : [const Text('0'), percentageWidget],
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Wrap(
            children: [
              LabeledIconButton(
                  iconData: Icons.email,
                  label: 'Yarn Requirements',
                  iconColor: color,
                  onTap: () {}),
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
                  iconData: Icons.featured_play_list,
                  label: 'My Product Listings',
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
        NavigateButton(label: 'My Product Listing Plan', onTap: () {}),
        NavigateButton(label: 'Suggest a Company/Yarn/Feature', onTap: () {}),
      ],
    );
  }
}
