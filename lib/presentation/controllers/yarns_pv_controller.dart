import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/share_helper.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class PvYarnsController extends BlocViewModelController<FetchPvYarnsBloc, FetchPvYarnsEvent,
    FetchPvYarnsState, YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  PvYarnsController(BuildContext context)
      : super(context, getIt.get<FetchPvYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchPvYarnsState s) {
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

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchPvYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchPvYarnsExpandedIndexChangedEvent(index));
  }

  onWatchlist(int index) {}

  onCompare(int index) {}

  onDetail(int index) {
    Navigator.pushNamed(context, YarnDetailPage.route, arguments: currentState.yarns[index]);
  }

  onShare(int index) {
    Share.share(ShareHelper().getYarnStringForSharing(currentState.yarns[index]));
  }

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
