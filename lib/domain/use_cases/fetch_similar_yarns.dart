import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';

class FetchSimilarYarns {
  final IYarnRepo _iYarnRepo;

  FetchSimilarYarns(this._iYarnRepo);

  Future<Either<Failure, List<Yarn>>> execute(String userId, String yarnType) async {
    return _iYarnRepo.fetchSimilarYarns(userId, yarnType);
  }
}