import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'rest_datasource/rest_datasource.dart';
import 'rest_datasource/rest_request.dart';
import 'rest_datasource/rest_response.dart';

@LazySingleton(as: RestDataSource)
class DioRestDataSource implements RestDataSource {
  final Dio dio;

  DioRestDataSource()
      : dio = Dio(
          BaseOptions(
            connectTimeout: 10000,
            receiveTimeout: 10000,
            baseUrl: 'http://localhost:3000/api',
          ),
        ) {
    //TODO add interceptor and replace baseUrl
  }

  Future<RestResponseWithFailure> _request(Future<Response> request) async {
    try {
      final response = await request;
      return RestResponse.create(response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          return RestResponseWithFailure(
            left(ConnectionFailure()),
          );

        case DioErrorType.response:
          return RestResponseWithFailure(
            left(
              ErrorResponseFailure(
                RestResponseError(
                  statusCode: e.response?.statusCode,
                  message: e.message,
                  extra: e.response?.data,
                ),
              ),
            ),
          );
        case DioErrorType.other:
          final error = e.error;
          if (error != null && error is SocketException) {
            return RestResponseWithFailure(
              left(ConnectionFailure()),
            );
          }
          return RestResponseWithFailure(
            left(OtherFailure(e.message)),
          );
        default:
          return RestResponseWithFailure(
            left(OtherFailure(e.toString())),
          );
      }
    } catch (e) {
      return RestResponseWithFailure(
        left(OtherFailure(e.toString())),
      );
    }
  }

  @override
  Future<RestResponseWithFailure> delete(RestRequest request) async {
    return _request(
      dio.delete(
        request.url,
        queryParameters: request.query,
        options: Options(
          headers: request.headers,
        ),
      ),
    );
  }

  @override
  Future<RestResponseWithFailure> get(RestRequest request) {
    return _request(
      dio.get(
        request.url,
        queryParameters: request.query,
        options: Options(
          headers: request.headers,
        ),
      ),
    );
  }

  @override
  Future<RestResponseWithFailure> patch(RestRequest request) {
    return _request(
      dio.patch(
        request.url,
        data: request.data,
        queryParameters: request.query,
        options: Options(
          headers: request.headers,
        ),
      ),
    );
  }

  @override
  Future<RestResponseWithFailure> post(RestRequest request) {
    return _request(
      dio.post(
        request.url,
        data: request.data,
        queryParameters: request.query,
        options: Options(
          headers: request.headers,
        ),
      ),
    );
  }

  @override
  Future<RestResponseWithFailure> put(RestRequest request) {
    return _request(
      dio.put(
        request.url,
        data: request.data,
        queryParameters: request.query,
        options: Options(
          headers: request.headers,
        ),
      ),
    );
  }
}
