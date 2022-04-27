import 'package:yarn_bazaar/common/view_model.dart';

class BottomNavigationBarViewModel extends ViewModel {
  final int selectedItemIndex;

  BottomNavigationBarViewModel({
    required this.selectedItemIndex,
  });

  @override
  List<Object?> get props => [selectedItemIndex];

  //TODO remove after other layers have been setup
  factory BottomNavigationBarViewModel.defaults() {
    return BottomNavigationBarViewModel(
      selectedItemIndex: 0,
    );
  }
}
