import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/cache_datasource/cache_datasource.dart';
import 'package:yarn_bazaar/injection.dart';

import 'shared/cache_datasource/shared_preferences_cache_datasource.dart';

@lazySingleton
class UserCacheDataSource extends SharedPreferencesCacheDataSource {
  final CacheDataSource cacheDataSource;
  final userCacheKey = "loggedInUser";

  UserCacheDataSource(this.cacheDataSource)
      : super(getIt.get<SharedPreferences>());
}
