import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_yarn_by_category.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/share_helper.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class TexturizeYarnsController extends BlocViewModelController<
    FetchTexturizeYarnsBloc,
    FetchTexturizeYarnsEvent,
    FetchTexturizeYarnsState,
    YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  TexturizeYarnsController(BuildContext context)
      : super(context, getIt.get<FetchTexturizeYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchTexturizeYarnsState s) {
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

  loadTexturizeYarns() {
    bloc.add(FetchTexturizeYarnsStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchTexturizeYarnsStoppedLoadingEvent());
      bloc.add(FetchTexturizeYarnsLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchYarnByCategory>().execute(
            a.id!,
            category: YarnCategories.Texturize,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchTexturizeYarnsStoppedLoadingEvent());
        bloc.add(FetchTexturizeYarnsLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchTexturizeYarnsStoppedLoadingEvent());
        bloc.add(FetchTexturizeYarnsDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadTexturizeYarns();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchTexturizeYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchTexturizeYarnsExpandedIndexChangedEvent(index));
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
            category: YarnCategories.Texturize,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        toastSuccess("Updated");
        bloc.add(FetchTexturizeYarnsDataChangedEvent(r));
      });
    });
  }
}
