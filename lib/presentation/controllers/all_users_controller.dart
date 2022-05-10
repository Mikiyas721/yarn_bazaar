import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/fetch_users_all/fetch_all_users_bloc.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';

class AllUsersController extends BlocViewModelController<FetchAllUsersBloc, FetchAllUsersEvent,
    FetchAllUsersState, UsersViewModel> {
  AllUsersController(BuildContext context)
      : super(context, getIt.get<FetchAllUsersBloc>(), true);

  @override
  UsersViewModel mapStateToViewModel(FetchAllUsersState s) {
    return UsersViewModel(
      users: s.users
          .map((e) => UserViewModel(
                companyName: e.updatedAt.toString(),
                location: e.updatedAt.toString(),
                numberOfYarnProducts: 0,
                lastUpdated: e.updatedAt.toString(),
                sellerType: e.updatedAt.toString(),
              ))
          .toList(),
      isLoading: s.isLoading,
      error: s.error.fold(() => null, (a) => a.message),
    );
  }

  onReload() {}

  onWatchlist(UserViewModel viewModel) {}

  onDetail(UserViewModel viewModel) {
    Navigator.pushNamed(context, '/directoryDetailPage', arguments: viewModel);
  }

  onShare(UserViewModel viewModel) {}

  Future<void> onRefresh () async {}

}
