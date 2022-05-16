import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class PvYarnsController extends BlocViewModelController<FetchPvYarnsBloc, FetchPvYarnsEvent,
    FetchPvYarnsState, YarnsViewModel> with ShortMessageMixin {
  PvYarnsController(BuildContext context)
      : super(context, getIt.get<FetchPvYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchPvYarnsState s) {
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

  loadPvYarns() {
    bloc.add(FetchPvYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchPvYarnsStoppedLoadingEvent());
      bloc.add(FetchPvYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.PV,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchPvYarnsStoppedLoadingEvent());
        bloc.add(FetchPvYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchPvYarnsStoppedLoadingEvent());
        bloc.add(FetchPvYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadPvYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchPvYarnsExpandedIndexChangedEvent(-1)
        : FetchPvYarnsExpandedIndexChangedEvent(index);
  }

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onDetail(YarnViewModel viewModel) {
    Navigator.pushNamed(context, '/priceListDetailPage', arguments: viewModel);
  }

  onShare(YarnViewModel viewModel) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.PV,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchPvYarnsDataChangedEvent(r));
      });
    });
  }
}
