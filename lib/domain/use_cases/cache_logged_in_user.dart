import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class CacheLoggedInUser {
  final IUserRepo _iUserRepo;

  const CacheLoggedInUser(this._iUserRepo);

  Future<bool> execute(AppUser user) async {
    return _iUserRepo.cacheLoggedInUser(user);
  }
}
