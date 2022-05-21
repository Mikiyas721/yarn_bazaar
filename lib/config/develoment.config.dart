import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/config/config.dart';

@LazySingleton(as: Config, env: ['development'])
class DevelopmentConfig implements Config{
  @override
  String get apiUrl => 'http://192.168.217.69:3000/api';
}