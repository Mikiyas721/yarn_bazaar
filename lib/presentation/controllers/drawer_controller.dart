import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class MyDrawerController
    extends BlocViewModelController<SplashBloc, SplashEvent, SplashState, DrawerViewModel> {
  MyDrawerController(BuildContext context) : super(context, getIt.get<SplashBloc>(), true);

  @override
  DrawerViewModel mapStateToViewModel(SplashState s) {
    return DrawerViewModel(
      imageUrl: s.appUser.fold(() => '', (a) => a.imageUrl ?? ''),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
    );
  }

  onEditAccount () {}
  onLogout () {}
  onDrawerItemClicked (int itemIndex) {}
}
