import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/share_helper.dart';

class UserDetailController extends ControllerWithOutBloc{
  UserDetailController(BuildContext context) : super(context);

  onFavourite() {}

  onShare(User user) {
    Share.share(ShareHelper().getUserStringForSharing(user));
  }

}