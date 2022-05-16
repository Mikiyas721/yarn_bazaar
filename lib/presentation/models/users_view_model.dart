import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/common/view_model.dart';

class UsersViewModel extends SimpleListViewModel<UserViewModel> {
  final int expandedIndex;
  UsersViewModel({
    required List<UserViewModel> users,
    required bool isLoading,
    required String? error,
    required this.expandedIndex,
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
}
