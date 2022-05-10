import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/fetch_yarns_all/fetch_all_yarns_bloc.dart';

class AllYarnsController extends BlocViewModelController<FetchAllYarnsBloc, FetchAllYarnsEvent,
    FetchAllYarnsState, YarnsViewModel> {
  AllYarnsController(BuildContext context)
      : super(context, getIt.get<FetchAllYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchAllYarnsState s) {
    //TODO match fields properly
    return YarnsViewModel(
      yarnList: s.yarns
          .map((e) => YarnViewModel(
                yarnQuality: e.quantityInKgs.value.toString(),
                quantityInKgs: e.quantityInKgs.value.toString(),
                companyName: e.quantityInKgs.value.toString(),
                companyType: e.quantityInKgs.value.toString(),
                deliveryArea: e.deliveryArea.value.toString(),
                lastUpdated: e.updatedAt.toString(),
                qualityDetails: e.quantityInKgs.value.toString(),
                sellerType: e.quantityInKgs.value.toString(),
                deliveryPeriod: e.deliveryPeriod,
              ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
    );
  }

  onReload() {}

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onDetail(YarnViewModel viewModel) {
    Navigator.pushNamed(context, '/priceListDetailPage', arguments: viewModel);
  }

  onShare(YarnViewModel viewModel) {}

  Future<void> onRefresh() async {}
}
