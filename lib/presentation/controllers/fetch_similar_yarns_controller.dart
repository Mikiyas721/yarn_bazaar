import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_similar_yarns.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/share_helper.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/application/fetch_similar_yarns/fetch_similar_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/yarn_detail_page.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';


class FetchSimilarYarnsController extends BlocViewModelController<
    FetchSimilarYarnsBloc,
    FetchSimilarYarnsEvent,
    FetchSimilarYarnsState,
    YarnsViewModel> with ShortMessageMixin, DateTimeMixin {
  final Yarn yarn;

  FetchSimilarYarnsController(
    BuildContext context,
    this.yarn,
  ) : super(context, getIt.get<FetchSimilarYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchSimilarYarnsState s) {
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

  loadSimilarYarns() async {
    bloc.add(FetchSimilarYarnsStartedLoadingEvent());
    final fetchResponse =
        await getIt.get<FetchSimilarYarns>().execute(yarn.user!.id!, yarn.yarnType);
    fetchResponse.fold((l) {
      bloc.add(FetchSimilarYarnsStoppedLoadingEvent());
      bloc.add(FetchSimilarYarnsLoadFailureEvent(getOption(l)));
    }, (r) {
      bloc.add(FetchSimilarYarnsStoppedLoadingEvent());
      bloc.add(FetchSimilarYarnsDataChangedEvent(r));
    });
  }

  onReload() {
    loadSimilarYarns();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchSimilarYarnsExpandedIndexChangedEvent(-1))
        : bloc.add(FetchSimilarYarnsExpandedIndexChangedEvent(index));
  }

  onWatchlist(int index) {}

  onCompare(int index) {}

  onDetail(int index) {
    Navigator.pushNamed(context, YarnDetailPage.route, arguments: currentState.yarns[index]);
  }

  onShare(int index) {
    Share.share(ShareHelper().getYarnStringForSharing(currentState.yarns[index]));
  }
}
