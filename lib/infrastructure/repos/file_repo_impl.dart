import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/file_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/file_datasource.dart';

@LazySingleton(as: IFileRepo)
class FileRepoImpl extends IFileRepo {
  final FileCrudDatasource _fileCrudDatasource;

  FileRepoImpl(this._fileCrudDatasource);

  @override
  String getDownloadLink(String containerName, String fileName) {
    return _fileCrudDatasource.getDownloadLink(containerName, fileName);
  }

  @override
  Future<Either<Failure, dynamic>> uploadFile(String containerName, FormData formData) {
    return _fileCrudDatasource.uploadFile(containerName, formData);
  }

  @override
  Future<Either<Failure, dynamic>> deleteFile(String containerName, String fileName) {
    return _fileCrudDatasource.deleteFile(containerName, fileName);
  }
}
