import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cache_datasource.dart';

@LazySingleton(as: CacheDataSource)
class SharedPreferencesCacheDataSource implements CacheDataSource {
  final SharedPreferences pref;

  SharedPreferencesCacheDataSource(this.pref);

  @override
  Future<bool> remove(String key) async {
    return pref.remove(key);
  }

  @override
  Future get(String key) async {
    return pref.get(key);
  }

  @override
  Future<bool> clear() async {
    return pref.clear();
  }

  @override
  Future saveBool(String key, bool value) {
    return pref.setBool(key, value);
  }

  @override
  Future saveDouble(String key, double value) {
    return pref.setDouble(key, value);
  }

  @override
  Future saveInt(String key, int value) {
    return pref.setInt(key, value);
  }

  @override
  Future saveList(String key, List value) {
    return pref.setString(key, jsonEncode(value));
  }

  @override
  Future saveMap(String key, Map value) {
    return pref.setString(key, jsonEncode(value));
  }

  @override
  Future saveString(String key, String value) {
    return pref.setString(key, value);
  }

  @override
  Future<Option<bool>> getBool(String key) async {
    try {
      final res = pref.getBool(key);
      if (res != null) return some(res);
    } catch (e) {}
    return none();
  }

  @override
  Future<Option<double>> getDouble(String key) async {
    try {
      final res = pref.getDouble(key);
      if (res != null) return some(res);
    } catch (e) {}
    return none();
  }

  @override
  Future<Option<int>> getInt(String key) async {
    try {
      final res = pref.getInt(key);
      if (res != null) return some(res);
    } catch (e) {}
    return none();
  }

  @override
  Future<Option<List>> getList(String key) async {
    try {
      final res = pref.getString(key);
      if (res != null) return some(jsonDecode(res));
    } catch (e) {}
    return none();
  }

  @override
  Future<Option<Map>> getMap(String key) async {
    try {
      final res = pref.getString(key);
      if (res != null) return some(jsonDecode(res));
    } catch (e) {}
    return none();
  }

  @override
  Future<Option<String>> getString(String key) async {
    try {
      final res = pref.getString(key);
      if (res != null) return some(res);
    } catch (e) {}
    return none();
  }
}
