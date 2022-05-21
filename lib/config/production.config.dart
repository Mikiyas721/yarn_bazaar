import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/config/config.dart';

@LazySingleton(as: Config, env: ['production'])
class ProductionConfig implements Config{
  @override
  String get apiUrl => throw UnimplementedError();
}