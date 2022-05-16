import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

@lazySingleton
class FetchYarnByCategory {
  final IYarnRepo _iYarnRepo;

  const FetchYarnByCategory(this._iYarnRepo);

  Future<Either<Failure, List<Yarn>>> execute(String currentUserId, {YarnCategories? category}) async {
    return _iYarnRepo.fetchByCategory(currentUserId, category?.getString());
  }
}
