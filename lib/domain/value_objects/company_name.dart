import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class CompanyNameFailure extends Failure {}

class EmptyCompanyNameFailure extends CompanyNameFailure {
  @override
  String get message => 'Company Name is required';
}

class InvalidCompanyNameFailure extends CompanyNameFailure {
  @override
  String get message => 'Invalid Company Name';
}

const companyNameRegExp = r'^[A-Za-z0-9]+ [A-Za-z]+$';

class CompanyName {
  final String value;

  CompanyName._(this.value);

  static Either<CompanyNameFailure, CompanyName> create(String companyName) {
    if (companyName.isEmpty) return left(EmptyCompanyNameFailure());
    final matched = RegExp(companyNameRegExp).firstMatch(companyName);
    if (matched == null) return left(InvalidCompanyNameFailure());
    return right(CompanyName._(companyName));
  }
}
