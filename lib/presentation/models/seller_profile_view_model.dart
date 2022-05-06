import 'package:yarn_bazaar/common/view_model.dart';

class SellerProfileViewModel extends ViewModel {
  final String imageUrl;
  final String username;
  final String workPlace;
  final double profileCompletedInPercent;

  SellerProfileViewModel({
    required this.imageUrl,
    required this.username,
    required this.workPlace,
    required this.profileCompletedInPercent,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        username,
        workPlace,
        profileCompletedInPercent,
      ];

  //TODO remove after other layers have been setup
  factory SellerProfileViewModel.defaults() {
    return SellerProfileViewModel(
      imageUrl: 'assets/images/avatar.png',
      username: 'Uday Sachdeva',
      workPlace: 'Sunshine enterprise',
      profileCompletedInPercent: 30
    );
  }
}
