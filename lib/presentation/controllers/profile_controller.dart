import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/models/profile_view_model.dart';
import 'package:yarn_bazaar/application/profile/profile_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/edit_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/suggestion_page.dart';

class ProfileController extends BlocViewModelController<ProfileBloc, ProfileEvent,
    ProfileState, ProfileViewModel> {
  ProfileController(BuildContext context) : super(context, getIt.get<ProfileBloc>(), true);

  @override
  ProfileViewModel mapStateToViewModel(ProfileState s) {
    return ProfileViewModel(
      selectedProfileIndex: s.selectedProfileIndex,
      imageUrl: s.appUser.fold(() => '', (a) => a.imageUrl),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
      profileCompletedInPercent: 30,
    );
  }

  onEditProfile() {
    Navigator.pushNamed(context, EditProfilePage.route);
  }

  onProfileTypeSelected(bool selectedFirstTab) {
    if (selectedFirstTab && bloc.state.selectedProfileIndex == 1) {
      bloc.add(ProfileBuyerSelectedEvent());
    } else if (!selectedFirstTab && bloc.state.selectedProfileIndex == 0) {
      bloc.add(ProfileSellerSelectedEvent());
    }
  }

  onBuyerPostYarnRequirement() {}

  onBuyerYarnRequirements() {}

  onBuyerMyInquiries() {}

  onBuyerMyOrders() {}

  onBuyerMyAddressList() {}

  onBuyerMyActivityLog() {}

  onBuyerMembershipDetail() {}

  onBuyerSuggestion() {
    Navigator.pushNamed(context, SuggestionPage.route);
  }

  onSellerYarnRequirements() {}

  onSellerMyInquiries() {}

  onSellerMyOrders() {}

  onSellerMyProductListings() {}

  onSellerMyBrokers() {}

  onSellerMyActivityLog() {}

  onSellerProductListingPlan() {}

  onSellerSuggestion() {
    Navigator.pushNamed(context, SuggestionPage.route);
  }
}
