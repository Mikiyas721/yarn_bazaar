import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_users_by_type.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_users_trader/fetch_trader_users_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class TraderUsersController extends BlocViewModelController<FetchTraderUsersBloc,
    FetchTraderUsersEvent,
    FetchTraderUsersState,
    UsersViewModel>
    with ShortMessageMixin {
  TraderUsersController(BuildContext context)
      : super(context, getIt.get<FetchTraderUsersBloc>(), true);

  @override
  UsersViewModel mapStateToViewModel(FetchTraderUsersState s) {
    return UsersViewModel(
      users: s.users
          .map((e) =>
          UserViewModel(
            companyName: e.businessDetail!.companyName,
            location: e.businessDetail?.address??'Unknown',
            numberOfYarnProducts: e.yarns!.length,
            lastUpdated: e.updatedAt.toString(),
            sellerType: e.businessDetail!.accountType,
          ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
      expandedIndex: s.expandedIndex,
    );
  }

  loadTraderUsers() {
    bloc.add(FetchTraderUsersStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchTraderUsersStoppedLoadingEvent());
      bloc.add(FetchTraderUsersLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(
        a.id!,
        userType: UserType.yarn_trader,
      );
      fetchResponse.fold((l) {
        bloc.add(FetchTraderUsersStoppedLoadingEvent());
        bloc.add(FetchTraderUsersLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchTraderUsersStoppedLoadingEvent());
        bloc.add(FetchTraderUsersDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadTraderUsers();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? bloc.add(FetchTraderUsersExpandedIndexChangedEvent(-1))
        : bloc.add(FetchTraderUsersExpandedIndexChangedEvent(index));
  }

  onWatchlist(UserViewModel viewModel) {}

  onDetail(UserViewModel viewModel) {
    Navigator.pushNamed(context, '/directoryDetailPage', arguments: viewModel);
  }

  onShare(UserViewModel viewModel) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(
        a.id!,
        userType: UserType.yarn_trader,
      );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        bloc.add(FetchTraderUsersDataChangedEvent(r));
        toastSuccess("Updated");
      });
    });
  }
}
