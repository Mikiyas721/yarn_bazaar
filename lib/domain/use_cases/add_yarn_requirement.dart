import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';

@lazySingleton
class AddYarnRequirement {
  final IYarnRepo _iYarnRepo;

  const AddYarnRequirement(this._iYarnRepo);

  Future<Either<Failure, Yarn>> execute(Yarn yarn) async {
    return _iYarnRepo.create(yarn);
  }
}
