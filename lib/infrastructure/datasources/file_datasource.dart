import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/config/config.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_request.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/business_detail_dto.dart';

abstract class FileCrudDatasource
    extends CrudDataSource<BusinessDetailDto, RestResponseFailure> {
  Future<Either<Failure, dynamic>> uploadFile(String containerName,FormData formData);
  String getDownloadLink(String containerName, String fileName);
  Future<Either<Failure, dynamic>> deleteFile(String containerName, String fileName);
}

@LazySingleton(as: FileCrudDatasource)
class FileLoopbackDatasource extends LoopbackRestCrudDataSource<BusinessDetailDto>
    implements FileCrudDatasource {
  final Config config;
  FileLoopbackDatasource(RestDataSource restDataSource, this.config)
      : super(
          '/containers',
          restDataSource,
          (yarn) => yarn.toJson(),
          (map) => BusinessDetailDto.fromJson(map),
        );

  @override
  String getDownloadLink(String containerName, String fileName) {
    return '${config.apiUrl}${path}/${containerName}/download/${fileName}';
  }

  @override
  Future<Either<Failure, dynamic>> uploadFile(String containerName, FormData formData) async{
    final response = await restDataSource.post(RestRequest(
      url: '$path/${containerName}/upload',
      data: formData,
    ));
    return response.either.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Failure, dynamic>> deleteFile(String containerName, String fileName) async{
    final response = await restDataSource.delete(RestRequest(
      url: '$path/${containerName}/files/${fileName}'
    ));
    return response.either.fold((l) => left(l), (r) => right(r));
  }

}
