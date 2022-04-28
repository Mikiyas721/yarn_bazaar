import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/buyer_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';

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
          left: size.width *
              buyerProfileViewModel.profileCompletedInPercent /
              100),
      child: Text('${buyerProfileViewModel.profileCompletedInPercent}%'),
    );
    return Column(
      children: [
        Container(
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(buyerProfileViewModel.imageUrl),
              ),
              Text(buyerProfileViewModel.username),
              Text(buyerProfileViewModel.workPlace),
              const Text('Profile Completed'),
              SizedBox(
                width: size.width,
                child: LinearProgressIndicator(
                  value: buyerProfileViewModel.profileCompletedInPercent,
                ),
              ),
              Row(
                children: buyerProfileViewModel.profileCompletedInPercent < 10
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
              OutlinedButton.icon(
                icon: const Icon(Icons.email),
                label: const Text('Post Yarn Requirement'),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    primary: color,
                    textStyle: TextStyle(
                      color: color,
                    )),
              ),
              LabeledIconButton(
                  iconData: Icons.email,
                  label: 'My Yarn Requirements',
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
                  iconData: Icons.book,
                  label: 'My Address List',
                  iconColor: color,
                  onTap: () {}),
              LabeledIconButton(
                  iconData: Icons.people_outline,
                  label: 'My Activity Log',
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
