import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_users_by_type.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_users_mill/fetch_mill_users_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/share_helper.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/user_detail_page.dart';

class MillUsersController extends BlocViewModelController<
    FetchMillUsersBloc,
    FetchMillUsersEvent,
    FetchMillUsersState,
    UsersViewModel> with ShortMessageMixin, DateTimeMixin {
  MillUsersController(BuildContext context)
      : super(context, getIt.get<FetchMillUsersBloc>(), true);

  @override
  UsersViewModel mapStateToViewModel(FetchMillUsersState s) {
    return UsersViewModel(
      users: s.users
          .map((e) => UserViewModel(
                companyName: e.businessDetail!.companyName!,
                location: e.businessDetail?.address ?? 'Unknown',
                numberOfYarnProducts: e.yarns!.length,
                lastUpdated: getShortDateWithOutDayOfWeekString(e.updatedAt!),
                sellerType: e.businessDetail!.accountType!,
              ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
      expandedIndex: s.expandedIndex,
    );
  }

  loadMillUsers() {
    bloc.add(FetchMillUsersStartedLoadingEvent());
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      bloc.add(FetchMillUsersStoppedLoadingEvent());
      bloc.add(FetchMillUsersLoadFailureEvent(
          SimpleFailure.withOption("Unable to find cached user")));
    }, (a) async {
      final fetchResponse1 = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.yarn_manufacturer,
          );
      final fetchResponse2 = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.fabric_manufacturer,
          );
      fetchResponse1.fold((l) {
        bloc.add(FetchMillUsersStoppedLoadingEvent());
        bloc.add(FetchMillUsersLoadFailureEvent(getOption(l)));
      }, (list1) {
        fetchResponse2.fold((l) {
          bloc.add(FetchMillUsersStoppedLoadingEvent());
          bloc.add(FetchMillUsersLoadFailureEvent(getOption(l)));
        }, (list2) {
          list1.addAll(list2);
          bloc.add(FetchMillUsersStoppedLoadingEvent());
          bloc.add(FetchMillUsersDataChangedEvent(list1));
        });
      });
    });
  }

  onReload() {
    loadMillUsers();
  }

  onHeaderTap(int index) {
    currentState.expandedIndex == index
        ? bloc.add(FetchMillUsersExpandedIndexChangedEvent(-1))
        : bloc.add(FetchMillUsersExpandedIndexChangedEvent(index));
  }

  onWatchlist(int index) {}

  onDetail(int index) {
    Navigator.pushNamed(context, UserDetailPage.route, arguments: currentState.users[index]);
  }

  onShare(int index) {
    Share.share(ShareHelper().getUserStringForSharing(currentState.users[index]));
  }

  Future<void> onRefresh() async {
    final splashBloc = getIt.get<SplashBloc>();
    splashBloc.state.appUser.fold(() {
      toastError("Unable to find cached user");
    }, (a) async {
      final fetchResponse1 = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.yarn_manufacturer,
          );
      final fetchResponse2 = await getIt.get<FetchUsersByType>().execute(
            a.id!,
            userType: UserType.fabric_manufacturer,
          );
      fetchResponse1.fold((l) {
        toastError(l.message);
      }, (list1) {
        fetchResponse2.fold((l) {
          toastError(l.message);
        }, (list2) {
          list1.addAll(list2);
          bloc.add(FetchMillUsersDataChangedEvent(list1));
          toastSuccess("Updated");
        });
      });
    });
  }
}
