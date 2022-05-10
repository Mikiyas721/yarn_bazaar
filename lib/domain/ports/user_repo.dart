import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

abstract class IUserRepo{
  Future<Either<Failure, User>> create(User user);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure,List<User>>> fetchAll(String currentUserId);
  Future<Either<Failure,List<User>>> fetchByUserType(String currentUserId, String userType);
  Future<Either<Failure,User>> fetchById(String id);
  Future<bool> cacheLoggedInUser(AppUser user);
  Future<Option<AppUser>> getCurrentLoggedInUser();
  Future<bool> clearLoggedInUser();
  Future<Either<Failure,AppUser >> loginUser(Credentials credentials);
}