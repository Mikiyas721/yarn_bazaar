import 'package:yarn_bazaar/presentation/models/view_model.dart';

class PricesViewModel extends SimpleListViewModel<PriceViewModel> {
  PricesViewModel({
    required List<PriceViewModel> priceList,
    required bool isLoading,
    required String error,
  }) : super(
          data: priceList,
          error: error,
          isLoading: isLoading,
        );

  factory PricesViewModel.defaults() {
    return PricesViewModel(
      priceList: const [],
      isLoading: false,
      error: '',
    );
  }
}

class PriceViewModel extends ViewModel {
  final String yarnQuality;
  final String quantityInKgs;
  final String companyName;
  final String companyType;
  final String deliveryArea;
  final String lastUpdated;
  final String qualityDetails;
  final String sellerType;
  final String deliveryPeriod;

  PriceViewModel({
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
