import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class SignInUser {
  final IUserRepo _iUserRepo;

  SignInUser(this._iUserRepo);

  Future<Either<Failure, AppUser>> execute(Credentials credentials) {
    return _iUserRepo.signInUser(credentials);
  }
}
