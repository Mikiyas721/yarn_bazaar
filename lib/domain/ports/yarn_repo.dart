import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

abstract class IYarnRepo{
  Future<Either<Failure, Yarn>> create(Yarn yarn);
  Future<Either<Failure, Yarn>> updateYarn(Yarn yarn);
  Future<Either<Failure,List<Yarn>>> fetchAll(String currentUserId);
  Future<Either<Failure,List<Yarn>>> fetchByCategory(String currentUserId, String? category);
  Future<Either<Failure,List<Yarn>>> fetchByUserId(String userId);
}