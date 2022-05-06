// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'domain/ports/bank_details_repo.dart' as _i12;
import 'domain/ports/business_details_repo.dart' as _i14;
import 'domain/ports/user_repo.dart' as _i24;
import 'domain/ports/yarn_repo.dart' as _i16;
import 'domain/use_cases/add_new_user.dart' as _i29;
import 'domain/use_cases/add_yarn_requirement.dart' as _i21;
import 'domain/use_cases/clear_loggedin_user.dart' as _i30;
import 'domain/use_cases/fetch_user_by_id.dart' as _i31;
import 'domain/use_cases/fetch_users_by_type.dart' as _i32;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i22;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i23;
import 'domain/use_cases/load_logged_in_user.dart' as _i26;
import 'domain/use_cases/save_user.dart' as _i27;
import 'domain/use_cases/update_user_bank_details.dart' as _i18;
import 'domain/use_cases/update_user_basic_info.dart' as _i28;
import 'domain/use_cases/update_user_business_details.dart' as _i19;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i8;
import 'infrastructure/datasources/business_details_datasource.dart' as _i9;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i10;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i11;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i4;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i3;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i20;
import 'infrastructure/datasources/user_datasource.dart' as _i6;
import 'infrastructure/datasources/yarn_datasource.dart' as _i7;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i13;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i15;
import 'infrastructure/repos/user_repo_impl.dart' as _i25;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i17;
import 'injection.dart' as _i33; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.RestDataSource>(() => _i4.DioRestDataSource());
  await gh.factoryAsync<_i5.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i6.UserCrudDatasource>(
      () => _i6.UserLoopbackDatasource(get<_i3.RestDataSource>()));
  gh.lazySingleton<_i7.YarnCrudDataSource>(
      () => _i7.YarnLoopbackDatasource(get<_i3.RestDataSource>()));
  gh.lazySingleton<_i8.BankDetailsCrudDatasource>(
      () => _i8.BankDetailsLoopbackDatasource(get<_i3.RestDataSource>()));
  gh.lazySingleton<_i9.BusinessDetailsCrudDatasource>(
      () => _i9.BusinessDetailsLoopbackDatasource(get<_i3.RestDataSource>()));
  gh.lazySingleton<_i10.CacheDataSource>(() =>
      _i11.SharedPreferencesCacheDataSource(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i12.IBankDetailsRepo>(
      () => _i13.BankDetailsRepoImpl(get<_i8.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i14.IBusinessDetailsRepo>(() =>
      _i15.BusinessDetailsRepoImpl(get<_i9.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i16.IYarnRepo>(
      () => _i17.YarnRepoImpl(get<_i7.YarnCrudDataSource>()));
  gh.factory<_i18.UpdateUserBankDetails>(
      () => _i18.UpdateUserBankDetails(get<_i12.IBankDetailsRepo>()));
  gh.factory<_i19.UpdateUserBusinessDetails>(
      () => _i19.UpdateUserBusinessDetails(get<_i14.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i20.UserCacheDataSource>(
      () => _i20.UserCacheDataSource(get<_i10.CacheDataSource>()));
  gh.lazySingleton<_i21.AddYarnRequirement>(
      () => _i21.AddYarnRequirement(get<_i16.IYarnRepo>()));
  gh.lazySingleton<_i22.FetchYarnByCategory>(
      () => _i22.FetchYarnByCategory(get<_i16.IYarnRepo>()));
  gh.lazySingleton<_i23.FetchYarnsOfUser>(
      () => _i23.FetchYarnsOfUser(get<_i16.IYarnRepo>()));
  gh.lazySingleton<_i24.IUserRepo>(() => _i25.UserRepoImpl(
      get<_i6.UserCrudDatasource>(), get<_i20.UserCacheDataSource>()));
  gh.lazySingleton<_i26.LoadLoggedInUser>(
      () => _i26.LoadLoggedInUser(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i27.SaveUser>(() => _i27.SaveUser(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i28.UpdateUserBasicInfo>(
      () => _i28.UpdateUserBasicInfo(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i29.AddNewUser>(
      () => _i29.AddNewUser(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i30.ClearLoggedInUser>(
      () => _i30.ClearLoggedInUser(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i31.FetchUsersById>(
      () => _i31.FetchUsersById(get<_i24.IUserRepo>()));
  gh.lazySingleton<_i32.FetchUsersByType>(
      () => _i32.FetchUsersByType(get<_i24.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i33.RegisterModule {}
