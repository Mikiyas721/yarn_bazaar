import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/widgets/my_image_view.dart';
import 'package:yarn_bazaar/presentation/widgets/navigate_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ProfileView extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  final List<Color> tabColors;

  final VoidCallback onBuyerPostYarnRequirement;
  final VoidCallback onBuyerYarnRequirements;
  final VoidCallback onBuyerMyInquiries;
  final VoidCallback onBuyerMyOrders;
  final VoidCallback onBuyerMyAddressList;
  final VoidCallback onBuyerMyActivityLog;
  final VoidCallback onBuyerMembershipDetail;
  final VoidCallback onBuyerSuggestion;

  final VoidCallback onSellerYarnRequirements;
  final VoidCallback onSellerMyInquiries;
  final VoidCallback onSellerMyOrders;
  final VoidCallback onSellerMyProductListings;
  final VoidCallback onSellerMyBrokers;
  final VoidCallback onSellerMyActivityLog;
  final VoidCallback onSellerProductListingPlan;
  final VoidCallback onSellerSuggestion;

  const ProfileView({
    Key? key,
    required this.profileViewModel,
    required this.tabColors,
    required this.onBuyerPostYarnRequirement,
    required this.onBuyerYarnRequirements,
    required this.onBuyerMyInquiries,
    required this.onBuyerMyOrders,
    required this.onBuyerMyAddressList,
    required this.onBuyerMyActivityLog,
    required this.onBuyerMembershipDetail,
    required this.onBuyerSuggestion,
    required this.onSellerYarnRequirements,
    required this.onSellerMyInquiries,
    required this.onSellerMyOrders,
    required this.onSellerMyProductListings,
    required this.onSellerMyBrokers,
    required this.onSellerMyActivityLog,
    required this.onSellerProductListingPlan,
    required this.onSellerSuggestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final percentageWidget = Padding(
      padding: EdgeInsets.only(
        left: ((size.width * 0.6) * profileViewModel.profileCompletedInPercent / 100) -
            (profileViewModel.profileCompletedInPercent > 99 ? 36 : 30),
      ),
      child: Text(
        '${profileViewModel.profileCompletedInPercent.toInt()}%',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
    return Column(
      children: [
        Container(
          color: tabColors[profileViewModel.selectedProfileIndex],
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyCircleAvatar(image: profileViewModel.imageUrl),
              10.vSpace,
              Text(
                profileViewModel.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                profileViewModel.workPlace,
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
                  value: profileViewModel.profileCompletedInPercent / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.black26,
                ),
              ),
              SizedBox(
                width: size.width * 0.61,
                child: Row(
                  children: profileViewModel.profileCompletedInPercent < 10
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
        profileViewModel.selectedProfileIndex == 0
            ? Container(
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
                          onPressed: onBuyerPostYarnRequirement,
                          style: OutlinedButton.styleFrom(
                            primary: tabColors[0],
                            textStyle: TextStyle(
                              color: tabColors[0],
                            ),
                            minimumSize: Size.infinite,
                            side: BorderSide(
                              width: 0.7,
                              color: tabColors[0],
                            ),
                          ),
                        ),
                      ),
                      LabeledIconButton(
                        iconData: Icons.email_outlined,
                        label: 'My Yarn Requirements',
                        iconColor: tabColors[0],
                        onTap: onBuyerYarnRequirements,
                      ),
                      LabeledIconButton(
                          iconData: Icons.question_answer_outlined,
                          label: 'My Inquiries',
                          iconColor: tabColors[0],
                          onTap: onBuyerMyInquiries),
                      LabeledIconButton(
                          iconData: Icons.shopping_cart_outlined,
                          label: 'My Orders',
                          iconColor: tabColors[0],
                          onTap: onBuyerMyOrders),
                      LabeledIconButton(
                          iconData: Icons.book_outlined,
                          label: 'My Address List',
                          iconColor: tabColors[0],
                          onTap: onBuyerMyAddressList),
                      LabeledIconButton(
                          iconData: Icons.article_outlined,
                          label: 'My Activity Log',
                          iconColor: tabColors[0],
                          onTap: onBuyerMyActivityLog),
                    ],
                  ),
                ),
              )
            : Container(
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
                        iconColor: tabColors[1],
                        onTap: onSellerYarnRequirements,
                      ),
                      LabeledIconButton(
                        iconData: Icons.question_answer_outlined,
                        label: 'My Inquiries',
                        iconColor: tabColors[1],
                        onTap: onSellerMyInquiries,
                      ),
                      LabeledIconButton(
                        iconData: Icons.shopping_cart_outlined,
                        label: 'My Orders',
                        iconColor: tabColors[1],
                        onTap: onSellerMyOrders,
                      ),
                      LabeledIconButton(
                        iconData: Icons.book_outlined,
                        label: 'My Products Listings',
                        iconColor: tabColors[1],
                        onTap: onSellerMyProductListings,
                      ),
                      LabeledIconButton(
                        iconData: Icons.people_outline,
                        label: 'My Brokers',
                        iconColor: tabColors[1],
                        onTap: onSellerMyBrokers,
                      ),
                      LabeledIconButton(
                        iconData: Icons.article_outlined,
                        label: 'My Activity Log',
                        iconColor: tabColors[1],
                        onTap: onSellerMyActivityLog,
                      ),
                    ],
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            15.vSpace,
            profileViewModel.selectedProfileIndex == 0
                ? NavigateButton(
                    label: 'My Product Listing Plan',
                    onTap: onBuyerMembershipDetail,
                  )
                : NavigateButton(
                    label: 'My Product Listing Plan',
                    onTap: onSellerProductListingPlan,
                  ),
            15.vSpace,
            profileViewModel.selectedProfileIndex == 0
                ? NavigateButton(
                    label: 'Suggest a Company/Yarn/Feature',
                    onTap: onBuyerSuggestion,
                  )
                : NavigateButton(
                    label: 'Suggest a Company/Yarn/Feature',
                    onTap: onSellerSuggestion,
                  ),
          ]),
        )
      ],
    );
  }
}
