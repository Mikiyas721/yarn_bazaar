import 'package:yarn_bazaar/common/view_model.dart';

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
}

class PriceViewModel extends ViewModel {
  @override
  List<Object?> get props => [];
}
