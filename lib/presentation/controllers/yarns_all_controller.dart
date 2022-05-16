import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/fetch_yarns_all/fetch_all_yarns_bloc.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class AllYarnsController extends BlocViewModelController<FetchAllYarnsBloc, FetchAllYarnsEvent,
    FetchAllYarnsState, YarnsViewModel> with ShortMessageMixin {
  AllYarnsController(BuildContext context)
      : super(context, getIt.get<FetchAllYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchAllYarnsState s) {
    return YarnsViewModel(
      yarnList: s.yarns
          .map((e) => YarnViewModel(
                count: e.count,
                yarnType: e.yarnType,
                quantityInKgs: e.quantityInKgs.value.toString(),
                companyName: e.user!.businessDetail!.companyName,
                companyType: e.quantityInKgs.value.toString(),
                deliveryArea: e.deliveryArea.value.toString(),
                lastUpdated: e.updatedAt.toString(),
                purpose: e.purpose,
                sellerType: e.user!.businessDetail!.accountType,
                deliveryPeriod: e.deliveryPeriod,
              ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
      expandedIndex: s.expandedIndex,
    );
  }

  loadAllYarns() {
    bloc.add(FetchAllYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchAllYarnsStoppedLoadingEvent());
      bloc.add(FetchAllYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(a.id!);
      fetchResponse.fold((l) {
        bloc.add(FetchAllYarnsStoppedLoadingEvent());
        bloc.add(FetchAllYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchAllYarnsStoppedLoadingEvent());
        bloc.add(FetchAllYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadAllYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchAllYarnsExpandedIndexChangedEvent(-1)
        : FetchAllYarnsExpandedIndexChangedEvent(index);
  }

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onShare(YarnViewModel viewModel) {}

  onDetail(YarnViewModel viewModel) {
    Navigator.pushNamed(context, '/priceListDetailPage', arguments: viewModel);
  }

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(a.id!);
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchAllYarnsDataChangedEvent(r));
      });
    });
  }
}
