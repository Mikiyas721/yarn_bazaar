import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import '../value_with_failure.dart';


abstract class CrudReadOnlyDataSource<T extends IdDto, F extends Failure> {
  Future<ValueWithFailure<F, T>> findOne({Map<String, dynamic> options});

  Future<ValueWithFailure<F, List<T>>> find({Map<String, dynamic> options});

  Future<ValueWithFailure<F, T>> findById(String id, {Map<String, dynamic> options});
}

abstract class CrudDataSource<T extends IdDto, F extends Failure> extends CrudReadOnlyDataSource<T, F> {
  Future<ValueWithFailure<F, T>> create(T t, {Map<String, dynamic> options});

  Future<ValueWithFailure<F, List<T>>> createAll(List<T> t, {Map<String, dynamic> options});

  Future<ValueWithFailure<F, T>> update(T t, {Map<String, dynamic> options});

  Future<ValueWithFailure<F, T>> updateWithMap(String id, Map<String, dynamic> data,
      {Map<String, dynamic> options});

  Future<ValueWithFailure<F, T>> replace(T t, {Map<String, dynamic> options});

  Future<ValueWithFailure<F, Unit>> deleteById(String id, {Map<String, dynamic> options});

  Future<ValueWithFailure<F, Unit>> deleteAll();

  Future<ValueWithFailure<F, int>> count({Map<String, dynamic> options});
}
