import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class FetchUsersByType {
  final IUserRepo _iUserRepo;

  const FetchUsersByType(this._iUserRepo);

  Future<Either<Failure, List<User>>> execute(
      String currentUserId, String userType) async {
    return _iUserRepo.fetchByUserType(currentUserId, userType);
  }
}
