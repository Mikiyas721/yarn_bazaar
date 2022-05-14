import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class LoadLoggedInUser {
  final IUserRepo _iUserRepo;

  const LoadLoggedInUser(this._iUserRepo);

  Future<Option<AppUser>> execute() async {
    return _iUserRepo.getCurrentLoggedInUser();
  }
}
