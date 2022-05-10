import 'package:yarn_bazaar/common/view_model.dart';

class ProfileViewModel extends ViewModel {
  final int selectedProfileIndex;
  final String imageUrl;
  final String username;
  final String workPlace;
  final double profileCompletedInPercent;

  ProfileViewModel({
    required this.selectedProfileIndex,
    required this.imageUrl,
    required this.username,
    required this.workPlace,
    required this.profileCompletedInPercent,
  });

  @override
  List<Object?> get props => [
    selectedProfileIndex,
    imageUrl,
    username,
    workPlace,
    profileCompletedInPercent,
  ];
}
