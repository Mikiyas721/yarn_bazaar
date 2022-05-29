import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class IFileRepo {
  Future<Either<Failure, dynamic>> uploadFile(String containerName, FormData formData);
  String getDownloadLink(String containerName, String fileName);
  Future<Either<Failure, dynamic>> deleteFile(String containerName, String fileName);
}
