import 'package:yarn_bazaar/common/view_model.dart';

class EditProfileViewModel extends ViewModel {
  final String imageUrl;
  final String username;
  final String workPlace;
  final double profileCompletedInPercent;

  EditProfileViewModel({
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

}
