import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class ViscoseYarnsController extends BlocViewModelController<FetchViscoseYarnsBloc,
    FetchViscoseYarnsEvent, FetchViscoseYarnsState, YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  ViscoseYarnsController(BuildContext context)
      : super(context, getIt.get<FetchViscoseYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchViscoseYarnsState s) {
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

  loadViscoseYarns() {
    bloc.add(FetchViscoseYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchViscoseYarnsStoppedLoadingEvent());
      bloc.add(FetchViscoseYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Viscose,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchViscoseYarnsStoppedLoadingEvent());
        bloc.add(FetchViscoseYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchViscoseYarnsStoppedLoadingEvent());
        bloc.add(FetchViscoseYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadViscoseYarns();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchViscoseYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchViscoseYarnsExpandedIndexChangedEvent(index));
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
            category: YarnCategories.Viscose,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchViscoseYarnsDataChangedEvent(r));
      });
    });
  }
}
