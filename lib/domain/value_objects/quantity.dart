import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class QuantityFailure extends Failure {}

class EmptyQuantityFailure extends QuantityFailure {
  @override
  String get message => 'Quantity is required';
}

class InvalidQuantityFailure extends QuantityFailure {
  @override
  String get message => 'Invalid quantity';
}

class Quantity{
  final double value;

  Quantity._(this.value);

  static Either<QuantityFailure, Quantity> create(String quantity){
    if(quantity.isEmpty) return left(EmptyQuantityFailure());
    final parsedQuantity = double.tryParse(quantity);
    if(parsedQuantity==null) return left(InvalidQuantityFailure());
    return right(Quantity._(parsedQuantity));
  }
}
