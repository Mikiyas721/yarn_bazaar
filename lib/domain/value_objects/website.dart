import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class WebsiteUrlFailure extends Failure {}

class InvalidWebsiteUrlFailure extends WebsiteUrlFailure {
  @override
  String get message => 'Invalid website';
}

const websiteRegExp = r'^(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

class WebsiteUrl {
  final String? value;

  WebsiteUrl._(this.value);

  static Either<WebsiteUrlFailure, WebsiteUrl> create(String? websiteUrl) {
    if(websiteUrl==null) return right(WebsiteUrl._(websiteUrl));
    final matched = RegExp(websiteRegExp).firstMatch(websiteUrl);
    if (matched == null) return left(InvalidWebsiteUrlFailure());
    return right(WebsiteUrl._(websiteUrl));
  }
}
