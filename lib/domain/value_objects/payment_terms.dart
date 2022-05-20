import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class PaymentTermsFailure extends Failure {}

class EmptyPaymentTermsFailure extends PaymentTermsFailure {
  @override
  String get message => 'Payment terms is required';
}

class InvalidPaymentTermsFailure extends PaymentTermsFailure {
  @override
  String get message => 'Invalid Payment Terms';
}

const paymentTermsRegExp = r'^[A-Za-z1-9][A-Za-z0-9 ]$';

class PaymentTerms {
  final String value;

  PaymentTerms._(this.value);

  static Either<PaymentTermsFailure, PaymentTerms> create(String paymentTerms) {
    if (paymentTerms.isEmpty) return left(EmptyPaymentTermsFailure());
    return right(PaymentTerms._(paymentTerms));
  }
}
