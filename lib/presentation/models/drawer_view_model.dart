import 'package:yarn_bazaar/common/view_model.dart';

class DrawerViewModel extends ViewModel {
  final String imageUrl;
  final String username;
  final String workPlace;

  DrawerViewModel({
    required this.imageUrl,
    required this.username,
    required this.workPlace,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        username,
        workPlace,
      ];

  //TODO remove after other layers have been setup
  factory DrawerViewModel.defaults() {
    return DrawerViewModel(
      imageUrl: 'assets/images/avatar.png',
      username: 'Uday Sachdeva',
      workPlace: 'Sunshine enterprise',
    );
  }
}
