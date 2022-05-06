import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

class ValueWithFailure<F extends Failure, V> {
  final Either<F, V> either;

  ValueWithFailure(this.either);

  isFailure() => either.isLeft();

  isValue() => either.isRight();

  V getOrElse(V Function() dflt) => either.fold((_) => dflt(), id);

  V? getOrNull() => either.fold((_) => null, id);

  V getOrThrow() => either.fold((error) => throw error, id);

  F? failureOrNull() => either.fold(id, (_) => null);

  F failureOrThrow() => either.fold(id, (_) => throw Error());

  B fold<B>(B Function(F l) ifLeft, B Function(V r) ifRight) => either.fold(ifLeft, ifRight);

  Option<V> toOption() => either.toOption();

  ifRight(Function(V?) onRight) {
    if (isValue()) {
      onRight(getOrNull());
    }
  }

  ifLeft(Function(F?) onLeft) {
    if (isFailure()) {
      onLeft(failureOrNull());
    }
  }
}
