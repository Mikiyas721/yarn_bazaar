import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';

class FancyYarnsController extends BlocViewModelController<FetchFancyYarnsBloc,
    FetchFancyYarnsEvent, FetchFancyYarnsState, YarnsViewModel> with ShortMessageMixin {
  FancyYarnsController(BuildContext context)
      : super(context, getIt.get<FetchFancyYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchFancyYarnsState s) {
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

  loadFancyYarns() {
    bloc.add(FetchFancyYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchFancyYarnsStoppedLoadingEvent());
      bloc.add(FetchFancyYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Fancy,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchFancyYarnsStoppedLoadingEvent());
        bloc.add(FetchFancyYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchFancyYarnsStoppedLoadingEvent());
        bloc.add(FetchFancyYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadFancyYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchFancyYarnsExpandedIndexChangedEvent(-1)
        : FetchFancyYarnsExpandedIndexChangedEvent(index);
  }

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onDetail(int index) {
    Navigator.pushNamed(context, YarnDetailPage.route, arguments: currentState.yarns[index]);
  }

  onShare(YarnViewModel viewModel) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Fancy,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchFancyYarnsDataChangedEvent(r));
      });
    });
  }
}
