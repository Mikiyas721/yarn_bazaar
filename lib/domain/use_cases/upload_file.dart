import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/file_repo.dart';

@lazySingleton
class UploadFile{
  final IFileRepo _iFileRepo;

  UploadFile(this._iFileRepo);
  Future<Either<Failure, dynamic>> execute(String containerName, FormData formData){
    return _iFileRepo.uploadFile(containerName, formData);
  }
}