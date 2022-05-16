import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_users_by_type.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_users_broker/fetch_broker_users_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class BrokerUsersController extends BlocViewModelController<FetchBrokerUsersBloc,
    FetchBrokerUsersEvent, FetchBrokerUsersState, UsersViewModel> with ShortMessageMixin {
  BrokerUsersController(BuildContext context)
      : super(context, getIt.get<FetchBrokerUsersBloc>(), true);

  @override
  UsersViewModel mapStateToViewModel(FetchBrokerUsersState s) {
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

  loadBrokerUsers() {
    bloc.add(FetchBrokerUsersStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchBrokerUsersStoppedLoadingEvent());
      bloc.add(FetchBrokerUsersLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.yarn_broker,
          );
      fetchResponse.fold((l) {
        bloc.add(FetchBrokerUsersStoppedLoadingEvent());
        bloc.add(FetchBrokerUsersLoadFailureEvent(getOption(l)));
      }, (r) {
        bloc.add(FetchBrokerUsersStoppedLoadingEvent());
        bloc.add(FetchBrokerUsersDataChangedEvent(r));
      });
    });
  }

  onReload() {
    loadBrokerUsers();
  }

  onHeaderTap(int index, bool wasExpanded) {
    wasExpanded
        ? bloc.add(FetchBrokerUsersExpandedIndexChangedEvent(-1))
        : bloc.add(FetchBrokerUsersExpandedIndexChangedEvent(index));
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
      final fetchResponse = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.yarn_broker,
          );
      fetchResponse.fold((l) {
        toastError(l.message);
      }, (r) {
        bloc.add(FetchBrokerUsersDataChangedEvent(r));
        toastSuccess("Updated");
      });
    });
  }
}
