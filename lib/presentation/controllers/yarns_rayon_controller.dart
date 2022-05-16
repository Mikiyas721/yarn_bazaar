import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class RayonYarnsController extends BlocViewModelController<FetchRayonYarnsBloc,
    FetchRayonYarnsEvent, FetchRayonYarnsState, YarnsViewModel> with ShortMessageMixin {
  RayonYarnsController(BuildContext context)
      : super(context, getIt.get<FetchRayonYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchRayonYarnsState s) {
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

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchRayonYarnsExpandedIndexChangedEvent(-1)
        : FetchRayonYarnsExpandedIndexChangedEvent(index);
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
