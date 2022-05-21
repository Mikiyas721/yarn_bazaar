import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/config/config.dart';

@LazySingleton(as: Config, env: ['staging'])
class StagingConfig implements Config{
  @override
  String get apiUrl => throw UnimplementedError();
}