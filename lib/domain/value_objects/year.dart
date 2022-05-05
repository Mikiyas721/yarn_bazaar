import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class YearFailure extends Failure {}

const yearRegExp = r'^[1-9]{4}$';

class InvalidYearFailure extends YearFailure {
  @override
  String get message => 'Invalid Year';
}

class VeryFarYearFailure extends YearFailure {
  @override
  String get message => 'Year has to be after 1822';
}

class FutureYearFailure extends YearFailure {
  @override
  String get message => 'Year has to be past value';
}

class Year {
  final String value;

  Year._(this.value);

  static Either<YearFailure, Year> create(String year) {
    if (RegExp(yearRegExp).firstMatch(year) == null) return left(InvalidYearFailure());
    final parsedYear = int.tryParse(year);
    if (parsedYear! < 1822) return left(VeryFarYearFailure());
    if (parsedYear > DateTime.now().year) return left(FutureYearFailure());
    return right(Year._(year));
  }
}
