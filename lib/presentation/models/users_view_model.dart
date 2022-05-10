import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/common/view_model.dart';

class UsersViewModel extends SimpleListViewModel<UserViewModel> {
  UsersViewModel({
    required List<UserViewModel> users,
    required bool isLoading,
    required String? error,
  }) : super(
          data: users,
          error: error,
          isLoading: isLoading,
        );
}

class UserViewModel extends ViewModel with FormatterMixin {
  final String companyName;
  final String location;
  final int numberOfYarnProducts;
  final String lastUpdated;
  final String sellerType;

  UserViewModel({
    required this.companyName,
    required this.location,
    required this.numberOfYarnProducts,
    required this.lastUpdated,
    required this.sellerType,
  });

  @override
  List<Object?> get props => [
        companyName,
        location,
        numberOfYarnProducts,
        lastUpdated,
        sellerType,
      ];

  String get initials {
    return getInitials(companyName);
  }

  //TODO remove after controllers have been setup
  factory UserViewModel.defaults() {
    return UserViewModel(
      companyName: 'Sarjan cotex PVT Ltd',
      location: 'Surat, India',
      numberOfYarnProducts: 2,
      lastUpdated: '2 days ago',
      sellerType: 'Trader',
    );
  }
}
