import 'package:yarn_bazaar/presentation/models/view_model.dart';

class BuyerProfileViewModel extends ViewModel {
  final String imageUrl;
  final String username;
  final String workPlace;
  final double profileCompletedInPercent;

  BuyerProfileViewModel({
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
  factory BuyerProfileViewModel.defaults() {
    return BuyerProfileViewModel(
        imageUrl: 'assets/images/avatar.png',
        username: 'Uday Sachdeva',
        workPlace: 'Sunshine enterprise',
        profileCompletedInPercent: 30
    );
  }
}
