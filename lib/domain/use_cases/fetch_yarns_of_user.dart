import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';

@lazySingleton
class FetchYarnsOfUser {
  final IYarnRepo _iYarnRepo;

  const FetchYarnsOfUser(this._iYarnRepo);

  Future<Either<Failure, List<Yarn>>> execute(String userId) async {
    return _iYarnRepo.fetchByUserId(userId);
  }
}
