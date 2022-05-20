import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class CPYarnsController extends BlocViewModelController<FetchCpYarnsBloc, FetchCpYarnsEvent,
    FetchCpYarnsState, YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  CPYarnsController(BuildContext context)
      : super(context, getIt.get<FetchCpYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchCpYarnsState s) {
    return YarnsViewModel(
      yarnList: s.yarns
          .map((e) => YarnViewModel(
                colour: e.colour,
                count: e.count,
                yarnType: e.yarnType,
                quantityInKgs: e.quantityInKgs.value.toString(),
                companyName: e.user!.businessDetail!.companyName!,
                companyType: e.user!.businessDetail!.accountType!.getUserType().getShortString(),
                deliveryArea: e.deliveryArea.value.toString(),
                lastUpdated: getShortDateWithOutDayOfWeekString(e.updatedAt!),
                purpose: e.purpose,
                sellerType: e.user!.businessDetail!.accountType!,
                deliveryPeriod: e.deliveryPeriod,
              ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
      expandedIndex: s.expandedIndex,
    );
  }

  loadCpYarns() {
    bloc.add(FetchCpYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchCpYarnsStoppedLoadingEvent());
      bloc.add(FetchCpYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.CP,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchCpYarnsStoppedLoadingEvent());
        bloc.add(FetchCpYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchCpYarnsStoppedLoadingEvent());
        bloc.add(FetchCpYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadCpYarns();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchCpYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchCpYarnsExpandedIndexChangedEvent(index));
  }

  onWatchlist(int index) {}

  onCompare(int index) {}

  onDetail(int index) {
    Navigator.pushNamed(context, YarnDetailPage.route, arguments: currentState.yarns[index]);
  }

  onShare(int index) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.CP,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchCpYarnsDataChangedEvent(r));
      });
    });
  }
}
