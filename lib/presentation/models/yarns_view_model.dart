import 'package:yarn_bazaar/common/view_model.dart';

class YarnsViewModel extends SimpleListViewModel<YarnViewModel> {
  YarnsViewModel({
    required List<YarnViewModel> yarnList,
    required bool isLoading,
    required String? error,
  }) : super(
          data: yarnList,
          error: error,
          isLoading: isLoading,
        );

}

class YarnViewModel extends ViewModel {
  final String yarnQuality;
  final String quantityInKgs;
  final String companyName;
  final String companyType;
  final String deliveryArea;
  final String lastUpdated;
  final String qualityDetails;
  final String sellerType;
  final String deliveryPeriod;

  YarnViewModel({
    required this.yarnQuality,
    required this.quantityInKgs,
    required this.companyName,
    required this.companyType,
    required this.deliveryArea,
    required this.lastUpdated,
    required this.qualityDetails,
    required this.sellerType,
    required this.deliveryPeriod,
  });

  @override
  List<Object?> get props => [
        yarnQuality,
        quantityInKgs,
        companyName,
        companyType,
        deliveryArea,
        lastUpdated,
        qualityDetails,
        sellerType,
        deliveryPeriod,
      ];

}
