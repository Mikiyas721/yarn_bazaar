import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/common/view_model.dart';

class DirectoriesViewModel extends SimpleListViewModel<DirectoryViewModel> {
  DirectoriesViewModel({
    required List<DirectoryViewModel> directoryList,
    required bool isLoading,
    required String? error,
  }) : super(
          data: directoryList,
          error: error,
          isLoading: isLoading,
        );

  factory DirectoriesViewModel.defaults() {
    return DirectoriesViewModel(
      directoryList: [
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
        DirectoryViewModel.defaults(),
      ],
      isLoading: false,
      error: null,
    );
  }
}

class DirectoryViewModel extends ViewModel with FormatterMixin {
  final String companyName;
  final String location;
  final int numberOfYarnProducts;
  final String lastUpdated;
  final String sellerType;

  DirectoryViewModel({
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
  factory DirectoryViewModel.defaults() {
    return DirectoryViewModel(
      companyName: 'Sarjan cotex PVT Ltd',
      location: 'Surat, India',
      numberOfYarnProducts: 2,
      lastUpdated: '2 days ago',
      sellerType: 'Trader',
    );
  }
}
