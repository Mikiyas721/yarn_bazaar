import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class AddNewUser {
  final IUserRepo _iUserRepo;

  const AddNewUser(this._iUserRepo);

  Future<Either<Failure, User>> execute(User user) async {
    return _iUserRepo.create(user);
  }
}
