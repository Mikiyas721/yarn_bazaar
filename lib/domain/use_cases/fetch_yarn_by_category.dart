import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';

@lazySingleton
class FetchYarnByCategory {
  final IYarnRepo _iYarnRepo;

  const FetchYarnByCategory(this._iYarnRepo);

  Future<Either<Failure, List<Yarn>>> execute(
      String currentUserId, String category) async {
    return _iYarnRepo.fetchByCategory(currentUserId, category);
  }
}
