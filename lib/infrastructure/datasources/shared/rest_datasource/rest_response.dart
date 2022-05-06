import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

import '../value_with_failure.dart';


class RestResponseError {
  final int? statusCode;
  final String? message;
  final dynamic extra;

  const RestResponseError({
    this.statusCode,
    this.message,
    this.extra,
  });

  @override
  String toString() {
    return 'RestResponseError{statusCode: $statusCode, message: $message, extra: $extra}';
  }
}

abstract class RestResponseFailure implements Failure {}

class ConnectionFailure implements RestResponseFailure {
  @override
  String get message => "Connection Failure";
}

class InvalidDataFailure implements RestResponseFailure {
  @override
  String get message => "Invalid Data Failure";
}

class ErrorResponseFailure implements RestResponseFailure {
  final RestResponseError error;

  const ErrorResponseFailure(this.error);

  @override
  String get message => "Error Response: ${error.message}";
}

class OtherFailure implements RestResponseFailure {
  final String message;

  OtherFailure(this.message);
}

class RestResponse {
  final dynamic value;

  RestResponse._(this.value);

  static RestResponseWithFailure create(dynamic value) {
    return RestResponseWithFailure(right(RestResponse._(value)));
  }
}

class RestResponseWithFailure extends ValueWithFailure<RestResponseFailure, RestResponse> {
  RestResponseWithFailure(
    Either<RestResponseFailure, RestResponse> either,
  ) : super(either);
}
