import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/domain/ports/file_repo.dart';

@lazySingleton
class GetFileDownloadLink{
  final IFileRepo _iFileRepo;

  GetFileDownloadLink(this._iFileRepo);

  String execute(String containerName, String fileName){
    return _iFileRepo.getDownloadLink(containerName, fileName);
  }
}