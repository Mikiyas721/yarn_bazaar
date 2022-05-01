import 'package:yarn_bazaar/presentation/models/view_model.dart';

class PricesViewModel extends SimpleListViewModel<PriceViewModel> {
  PricesViewModel({
    required List<PriceViewModel> priceList,
    required bool isLoading,
    required String? error,
  }) : super(
          data: priceList,
          error: error,
          isLoading: isLoading,
        );

  factory PricesViewModel.defaults() {
    return PricesViewModel(
      priceList: [
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
        PriceViewModel.defaults(),
      ],
      isLoading: false,
      error: null,
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

  factory PriceViewModel.defaults() {
    return PriceViewModel(
      yarnQuality: '30s Cotton',
      quantityInKgs: '0',
      companyName: 'ASHIWAD COTSPIN LLP',
      companyType: 'Ex-Mill',
      deliveryArea: 'Madurai, India',
      lastUpdated: '09 Feb 2022',
      qualityDetails: 'Hosiery, Ring Frame, Combed',
      sellerType: 'Trader',
      deliveryPeriod: '1 week',
    );
  }
}
