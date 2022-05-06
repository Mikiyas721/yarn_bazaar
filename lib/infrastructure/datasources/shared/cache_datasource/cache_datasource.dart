import 'package:dartz/dartz.dart';

abstract class CacheDataSource {
  Future saveBool(String key, bool value);

  Future saveInt(String key, int value);

  Future saveDouble(String key, double value);

  Future saveString(String key, String value);

  Future saveList(String key, List value);

  Future saveMap(String key, Map value);

  Future<dynamic> get(String key);

  Future<Option<bool>> getBool(String key);

  Future<Option<int>> getInt(String key);

  Future<Option<double>> getDouble(String key);

  Future<Option<String>> getString(String key);

  Future<Option<Map>> getMap(String key);

  Future<Option<List>> getList(String key);

  Future<bool> remove(String key);

  Future<bool> clear();
}
