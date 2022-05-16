import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class LinenYarnsController extends BlocViewModelController<FetchLinenYarnsBloc,
    FetchLinenYarnsEvent, FetchLinenYarnsState, YarnsViewModel> with ShortMessageMixin {
  LinenYarnsController(BuildContext context)
      : super(context, getIt.get<FetchLinenYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchLinenYarnsState s) {
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

  loadLinenYarns() {
    bloc.add(FetchLinenYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchLinenYarnsStoppedLoadingEvent());
      bloc.add(FetchLinenYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Linen,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchLinenYarnsStoppedLoadingEvent());
        bloc.add(FetchLinenYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchLinenYarnsStoppedLoadingEvent());
        bloc.add(FetchLinenYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadLinenYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchLinenYarnsExpandedIndexChangedEvent(-1)
        : FetchLinenYarnsExpandedIndexChangedEvent(index);
  }

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onDetail(int index) {
    Navigator.pushNamed(context, '/yarnDetailPage', arguments: currentState.yarns[index]);
  }

  onShare(YarnViewModel viewModel) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Linen,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchLinenYarnsDataChangedEvent(r));
      });
    });
  }
}
