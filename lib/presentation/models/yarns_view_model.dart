import 'package:yarn_bazaar/common/view_model.dart';

class YarnsViewModel extends SimpleListViewModel<YarnViewModel> {
  final int expandedIndex;
  YarnsViewModel({
    required List<YarnViewModel> yarnList,
    required bool isLoading,
    required String? error,
    required this.expandedIndex,
  }) : super(
          data: yarnList,
          error: error,
          isLoading: isLoading,
        );
}

class YarnViewModel extends ViewModel {
  final String count;
  final String yarnType;
  final String quantityInKgs;
  final String companyName;
  final String companyType;
  final String deliveryArea;
  final String lastUpdated;
  final String purpose;
  final String sellerType;
  final String deliveryPeriod;

  YarnViewModel({
    required this.count,
    required this.yarnType,
    required this.quantityInKgs,
    required this.companyName,
    required this.companyType,
    required this.deliveryArea,
    required this.lastUpdated,
    required this.purpose,
    required this.sellerType,
    required this.deliveryPeriod,
  });

  @override
  List<Object?> get props => [
        count,
        yarnType,
        quantityInKgs,
        companyName,
        companyType,
        deliveryArea,
        lastUpdated,
        purpose,
        sellerType,
        deliveryPeriod,
      ];
}
