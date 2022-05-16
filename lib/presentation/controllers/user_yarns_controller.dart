import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_user_yarns.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_user_yarns/fetch_user_yarns_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';

class UserYarnsController extends BlocViewModelController<FetchUserYarnsBloc,
    FetchUserYarnsEvent, FetchUserYarnsState, YarnsViewModel> with ShortMessageMixin {
  final String userId;

  UserYarnsController(
    BuildContext context,
    this.userId,
  ) : super(context, getIt.get<FetchUserYarnsBloc>(), true);

  @override
  YarnsViewModel mapStateToViewModel(FetchUserYarnsState s) {
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

  setUserYarns(List<Yarn> yarns) {
    bloc.add(FetchUserYarnsDataChangedEvent(yarns));
  }

  loadUserYarns() async {
    bloc.add(FetchUserYarnsStartedLoadingEvent());
    final fetchResponse = await getIt.get<FetchUserYarns>().execute(userId);
    fetchResponse.fold((l) {
      bloc.add(FetchUserYarnsStoppedLoadingEvent());
      bloc.add(FetchUserYarnsLoadFailureEvent(getOption(l)));
    }, (r) {
      bloc.add(FetchUserYarnsStoppedLoadingEvent());
      bloc.add(FetchUserYarnsDataChangedEvent(r));
    });
  }

  onReload() {
    loadUserYarns();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? FetchUserYarnsExpandedIndexChangedEvent(-1)
        : FetchUserYarnsExpandedIndexChangedEvent(index);
  }

  onWatchlist(YarnViewModel viewModel) {}

  onCompare(YarnViewModel viewModel) {}

  onDetail(int index) {
    Navigator.pushNamed(context, '/yarnDetailPage', arguments: currentState.yarns[index]);
  }

  onShare(YarnViewModel viewModel) {}

  Future<void> onRefresh() async {
    bloc.add(FetchUserYarnsStartedLoadingEvent());
    final fetchResponse = await getIt.get<FetchUserYarns>().execute(userId);
    fetchResponse.fold((l) {
      toastError(l.message);
    }, (r) {
      toastSuccess("Updated");
      bloc.add(FetchUserYarnsDataChangedEvent(r));
    });
  }
}
