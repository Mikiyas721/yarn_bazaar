import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';

class WorstedWoolYarnsController extends BlocViewModelController<
    FetchWorstedWoolYarnsBloc,
    FetchWorstedWoolYarnsEvent,
    FetchWorstedWoolYarnsState,
    YarnsViewModel> with ShortMessageMixin {
  WorstedWoolYarnsController(BuildContext context)
      : super(context, getIt.get<FetchWorstedWoolYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchWorstedWoolYarnsState s) {
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

  loadWorstedWoolYarns() {
    bloc.add(FetchWorstedWoolYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchWorstedWoolYarnsStoppedLoadingEvent());
      bloc.add(FetchWorstedWoolYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.WorstedWool,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchWorstedWoolYarnsStoppedLoadingEvent());
        bloc.add(FetchWorstedWoolYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchWorstedWoolYarnsStoppedLoadingEvent());
        bloc.add(FetchWorstedWoolYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadWorstedWoolYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchWorstedWoolYarnsExpandedIndexChangedEvent(-1)
        : FetchWorstedWoolYarnsExpandedIndexChangedEvent(index);
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
            category: YarnCategories.WorstedWool,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchWorstedWoolYarnsDataChangedEvent(r));
      });
    });
  }
}
