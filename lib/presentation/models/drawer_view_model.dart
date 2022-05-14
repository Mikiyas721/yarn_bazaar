import 'package:yarn_bazaar/common/view_model.dart';

class DrawerViewModel extends ViewModel {
  final String? imageUrl;
  final String username;
  final String workPlace;

  DrawerViewModel({
    this.imageUrl,
    required this.username,
    required this.workPlace,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        username,
        workPlace,
      ];
}
