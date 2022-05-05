import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class FetchUsersById {
  final IUserRepo _iUserRepo;

  const FetchUsersById(this._iUserRepo);

  Future<Either<Failure, User>> execute(String id) async {
    return _iUserRepo.fetchById(id);
  }
}
