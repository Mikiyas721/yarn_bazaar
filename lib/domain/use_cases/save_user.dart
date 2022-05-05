import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';

@lazySingleton
class SaveUser {
  final IUserRepo _iUserRepo;

  const SaveUser(this._iUserRepo);

  Future execute(User user) async {
    return _iUserRepo.saveLoggedInUser(user);
  }
}
