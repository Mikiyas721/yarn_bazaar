import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_users_by_type.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_users_all/fetch_all_users_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class AllUsersController extends BlocViewModelController<FetchAllUsersBloc, FetchAllUsersEvent,
    FetchAllUsersState, UsersViewModel> with ShortMessageMixin {
  AllUsersController(BuildContext context)
      : super(context, getIt.get<FetchAllUsersBloc>(), true);

  @override
  UsersViewModel mapStateToViewModel(FetchAllUsersState s) {
    return UsersViewModel(
      users: s.users
          .map((e) => UserViewModel(
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

  loadAllUsers() {
    bloc.add(FetchAllUsersStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchAllUsersStoppedLoadingEvent());
      bloc.add(FetchAllUsersLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(a.id!);
      fetchResponse.fold((l) {
        bloc.add(FetchAllUsersStoppedLoadingEvent());
        bloc.add(FetchAllUsersLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchAllUsersStoppedLoadingEvent());
        bloc.add(FetchAllUsersDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadAllUsers();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? bloc.add(FetchAllUsersExpandedIndexChangedEvent(-1))
        : bloc.add(FetchAllUsersExpandedIndexChangedEvent(index));
  }

  onWatchlist(UserViewModel viewModel) {}

  onDetail(UserViewModel viewModel) {
    Navigator.pushNamed(context, '/userDetailPage', arguments: viewModel);
  }

  onShare(UserViewModel viewModel) {}

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(a.id!);
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        bloc.add(FetchAllUsersDataChangedEvent(r));
        toastSuccess("Updated");
      });
    });
  }
}
