import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import '../rest_datasource/rest_datasource.dart';
import '../rest_datasource/rest_request.dart';
import '../rest_datasource/rest_response.dart';

import '../value_with_failure.dart';
import 'crud_datasource.dart';

class LoopbackRestCrudReadOnlyDataSource<T extends IdDto>
    implements CrudReadOnlyDataSource<T, RestResponseFailure> {
  final String path;
  final RestDataSource restDataSource;
  final T Function(dynamic) decode;

  LoopbackRestCrudReadOnlyDataSource(
    this.path,
    this.restDataSource,
    this.decode,
  );

  ValueWithFailure<RestResponseFailure, Y> _foldResponse<Y>(
    RestResponseWithFailure response,
    ValueWithFailure<RestResponseFailure, Y> Function(RestResponse) onRight,
  ) {
    return response.fold((l) => ValueWithFailure(left(l)), onRight);
  }

  ValueWithFailure<RestResponseFailure, List<T>> _foldListResponse(
    RestResponseWithFailure response,
  ) {
    return _foldResponse(
      response,
      (r) {
        if (r.value is List) {
          final list = r.value as List;
          return ValueWithFailure(right(list.map(decode).toList()));
        }
        return ValueWithFailure(
          left(InvalidDataFailure()),
        );
      },
    );
  }

  ValueWithFailure<RestResponseFailure, T> foldValueResponse(
    RestResponseWithFailure response,
  ) {
    return _foldResponse(
      response,
      (r) => ValueWithFailure(right(decode(r.value))),
    );
  }

  Map<String, String> filterFromOptions(Map<String, dynamic>? options) {
    return {
      if ((options ?? {})['filter'] != null) ...{'filter': jsonEncode(options!['filter'])}
    };
  }

  Map<String, dynamic> whereFromOptions(Map<String, dynamic>? options) {
    return {
      if ((options ?? {})['where']) ...{'where': jsonEncode(options!['where'])}
    };
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, List<T>>> find({Map<String, dynamic>? options}) async {
    final response = await restDataSource.get(
          RestRequest(url: path, query: filterFromOptions(options)),
        );
    return _foldListResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> findById(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await restDataSource.get(
          RestRequest(url: '$path/$id', query: filterFromOptions(options)),
        );
    return foldValueResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> findOne({Map<String, dynamic>? options}) async {
    final response = await restDataSource.get(
          RestRequest(url: '$path/findOne', query: filterFromOptions(options)),
        );
    return foldValueResponse(response);
  }
}

class LoopbackRestCrudDataSource<T extends IdDto> extends LoopbackRestCrudReadOnlyDataSource<T>
    implements CrudDataSource<T, RestResponseFailure> {
  final String path;
  final RestDataSource restDataSource;

  final T Function(dynamic) decode;
  final dynamic Function(T) encode;

  LoopbackRestCrudDataSource(
    this.path,
    this.restDataSource,
    this.encode,
    this.decode,
  ) : super(
          path,
          restDataSource,
          decode,
        );

  @override
  Future<ValueWithFailure<RestResponseFailure, int>> count({Map<String, dynamic>? options}) async {
    final response = await restDataSource.get(
          RestRequest(url: '$path/count', query: whereFromOptions(options)),
        );
    return _foldResponse(response, (r) {
      final map = r.value;
      if (map is Map) {
        final count = map['count'];
        if (count != null && count is int) {
          return ValueWithFailure(right(count));
        }
      }
      return ValueWithFailure(
        left(InvalidDataFailure()),
      );
    });
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> create(T t, {Map<String, dynamic>? options}) async {
    final response = await restDataSource.post(
          RestRequest(url: path, data: encode(t)),
        );
    return foldValueResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> update(T t, {Map<String, dynamic>? options}) async {
    final response = await restDataSource.patch(
          RestRequest(url: '$path/${t.id}', data: encode(t)),
        );
    return foldValueResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> updateWithMap(
    String id,
    Map<String, dynamic> data, {
    Map<String, dynamic>? options,
  }) async {
    final response = await restDataSource.patch(
          RestRequest(url: '$path/$id', data: data),
        );
    return foldValueResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, T>> replace(T t, {Map<String, dynamic>? options}) async {
    final response = await restDataSource.put(
          RestRequest(url: '$path/${t.id}', data: encode(t)),
        );
    return foldValueResponse(response);
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, Unit>> deleteById(String id,
      {Map<String, dynamic>? options}) async {
    final response = await restDataSource.delete(
          RestRequest(url: '$path/$id'),
        );
    return _foldResponse(response, (r) => ValueWithFailure(right(unit)));
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, List<T>>> createAll(List<T> t,
      {Map<String, dynamic>? options}) {
    // TODO: implement createAll
    throw UnimplementedError();
  }

  @override
  Future<ValueWithFailure<RestResponseFailure, Unit>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }
}
