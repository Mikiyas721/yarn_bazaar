import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class RayonYarnsController extends BlocViewModelController<FetchRayonYarnsBloc,
    FetchRayonYarnsEvent, FetchRayonYarnsState, YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  RayonYarnsController(BuildContext context)
      : super(context, getIt.get<FetchRayonYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchRayonYarnsState s) {
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

  loadRayonYarns() {
    bloc.add(FetchRayonYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchRayonYarnsStoppedLoadingEvent());
      bloc.add(FetchRayonYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Rayon,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchRayonYarnsStoppedLoadingEvent());
        bloc.add(FetchRayonYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchRayonYarnsStoppedLoadingEvent());
        bloc.add(FetchRayonYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadRayonYarns();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchRayonYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchRayonYarnsExpandedIndexChangedEvent(index));
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
            category: YarnCategories.Rayon,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchRayonYarnsDataChangedEvent(r));
      });
    });
  }
}
