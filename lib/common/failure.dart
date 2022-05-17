import 'package:dartz/dartz.dart';

abstract class Failure {
  String get message;
}

class SimpleFailure implements Failure {
  @override
  final String message;

  const SimpleFailure(this.message);

  static Option<SimpleFailure> withOption(String message) {
    return getOption<SimpleFailure>(SimpleFailure(message));
  }
}

Option<T> getOption<T>(T? object) {
  return object == null ? none() : some(object);
}
