import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/file_repo.dart';

@lazySingleton
class DeleteFile {
  final IFileRepo _iFileRepo;

  DeleteFile(this._iFileRepo);

  Future<Either<Failure, dynamic>> execute(String containerName, String fileName){
    return _iFileRepo.deleteFile(containerName, fileName);
  }
}