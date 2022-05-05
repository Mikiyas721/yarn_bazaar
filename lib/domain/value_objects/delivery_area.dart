import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class LocationFailure extends Failure {}

class EmptyLocationFailure extends LocationFailure {
  @override
  String get message => 'Delivery area is required';
}

class InvalidLocationFailure extends LocationFailure {
  @override
  String get message => 'Invalid Delivery area';
}

const locationRegExp = r'^[A-Za-z]+, [A-Za-z]+$';

class Location {
  final String value;

  Location._(this.value);

  static Either<LocationFailure, Location> create(String location) {
    if (location.isEmpty) return left(EmptyLocationFailure());
    final matched = RegExp(locationRegExp).firstMatch(location);
    if (matched == null) return left(InvalidLocationFailure());
    return right(Location._(location));
  }
}
