// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i29;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/bottom_navigation/bottom_navigation_bloc.dart' as _i4;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i5;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i6;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i7;
import 'application/edit_password/edit_password_bloc.dart' as _i8;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i9;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i11;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i16;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i23;
import 'application/fetch_yarns_all/fetch_all_yarns_bloc.dart' as _i10;
import 'application/fetch_yarns_cotton/fetch_cotton_yarns_bloc.dart' as _i12;
import 'application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart' as _i13;
import 'application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart' as _i14;
import 'application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart' as _i15;
import 'application/fetch_yarns_modal/fetch_modal_yarns_bloc.dart' as _i17;
import 'application/fetch_yarns_pc/fetch_pc_yarns_bloc.dart' as _i18;
import 'application/fetch_yarns_psf/fetch_psf_yarns_bloc.dart' as _i19;
import 'application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart' as _i20;
import 'application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart' as _i21;
import 'application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart'
    as _i22;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i24;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i25;
import 'application/profile/profile_bloc.dart' as _i26;
import 'application/sign_in/sign_in_bloc.dart' as _i30;
import 'application/sign_up/sign_up_bloc.dart' as _i31;
import 'application/splash/splash_bloc.dart' as _i32;
import 'domain/ports/bank_details_repo.dart' as _i39;
import 'domain/ports/business_details_repo.dart' as _i41;
import 'domain/ports/user_repo.dart' as _i53;
import 'domain/ports/yarn_repo.dart' as _i43;
import 'domain/use_cases/add_new_user.dart' as _i58;
import 'domain/use_cases/add_yarn_requirement.dart' as _i48;
import 'domain/use_cases/cache_logged_in_user.dart' as _i59;
import 'domain/use_cases/clear_logged_in_user.dart' as _i60;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i49;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i61;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i50;
import 'domain/use_cases/fetch_user_by_id.dart' as _i62;
import 'domain/use_cases/fetch_users_by_type.dart' as _i63;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i51;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i52;
import 'domain/use_cases/load_logged_in_user.dart' as _i55;
import 'domain/use_cases/login_user.dart' as _i56;
import 'domain/use_cases/update_user_bank_details.dart' as _i45;
import 'domain/use_cases/update_user_basic_info.dart' as _i57;
import 'domain/use_cases/update_user_business_details.dart' as _i46;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i35;
import 'infrastructure/datasources/business_details_datasource.dart' as _i36;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i37;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i38;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i28;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i27;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i47;
import 'infrastructure/datasources/user_datasource.dart' as _i33;
import 'infrastructure/datasources/yarn_datasource.dart' as _i34;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i40;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i42;
import 'infrastructure/repos/user_repo_impl.dart' as _i54;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i44;
import 'injection.dart' as _i64; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AddYarnRequirementBloc>(() => _i3.AddYarnRequirementBloc());
  gh.lazySingleton<_i4.BottomNavigationBloc>(() => _i4.BottomNavigationBloc());
  gh.factory<_i5.EditBankDetailsBloc>(() => _i5.EditBankDetailsBloc());
  gh.factory<_i6.EditBasicInformationBloc>(
      () => _i6.EditBasicInformationBloc());
  gh.lazySingleton<_i7.EditBusinessDetailsBloc>(
      () => _i7.EditBusinessDetailsBloc());
  gh.factory<_i8.EditPasswordBloc>(() => _i8.EditPasswordBloc());
  gh.factory<_i9.FetchAllUsersBloc>(() => _i9.FetchAllUsersBloc());
  gh.factory<_i10.FetchAllYarnsBloc>(() => _i10.FetchAllYarnsBloc());
  gh.factory<_i11.FetchBrokerUsersBloc>(() => _i11.FetchBrokerUsersBloc());
  gh.factory<_i12.FetchCottonYarnsBloc>(() => _i12.FetchCottonYarnsBloc());
  gh.factory<_i13.FetchCpYarnsBloc>(() => _i13.FetchCpYarnsBloc());
  gh.factory<_i14.FetchFancyYarnsBloc>(() => _i14.FetchFancyYarnsBloc());
  gh.factory<_i15.FetchLinenYarnsBloc>(() => _i15.FetchLinenYarnsBloc());
  gh.factory<_i16.FetchMillUsersBloc>(() => _i16.FetchMillUsersBloc());
  gh.factory<_i17.FetchModalYarnsBloc>(() => _i17.FetchModalYarnsBloc());
  gh.factory<_i18.FetchPcYarnsBloc>(() => _i18.FetchPcYarnsBloc());
  gh.factory<_i19.FetchPsfYarnsBloc>(() => _i19.FetchPsfYarnsBloc());
  gh.factory<_i20.FetchPvYarnsBloc>(() => _i20.FetchPvYarnsBloc());
  gh.factory<_i21.FetchRayonYarnsBloc>(() => _i21.FetchRayonYarnsBloc());
  gh.factory<_i22.FetchTexturizeYarnsBloc>(
      () => _i22.FetchTexturizeYarnsBloc());
  gh.factory<_i23.FetchTraderUsersBloc>(() => _i23.FetchTraderUsersBloc());
  gh.factory<_i24.FetchViscoseYarnsBloc>(() => _i24.FetchViscoseYarnsBloc());
  gh.factory<_i25.FetchWorstedWoolYarnsBloc>(
      () => _i25.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i26.ProfileBloc>(() => _i26.ProfileBloc());
  gh.lazySingleton<_i27.RestDataSource>(() => _i28.DioRestDataSource());
  await gh.factoryAsync<_i29.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i30.SignInBloc>(() => _i30.SignInBloc());
  gh.factory<_i31.SignUpBloc>(() => _i31.SignUpBloc());
  gh.factory<_i32.SplashBloc>(() => _i32.SplashBloc());
  gh.lazySingleton<_i33.UserCrudDatasource>(
      () => _i33.UserLoopbackDatasource(get<_i27.RestDataSource>()));
  gh.lazySingleton<_i34.YarnCrudDataSource>(
      () => _i34.YarnLoopbackDatasource(get<_i27.RestDataSource>()));
  gh.lazySingleton<_i35.BankDetailsCrudDatasource>(
      () => _i35.BankDetailsLoopbackDatasource(get<_i27.RestDataSource>()));
  gh.lazySingleton<_i36.BusinessDetailsCrudDatasource>(
      () => _i36.BusinessDetailsLoopbackDatasource(get<_i27.RestDataSource>()));
  gh.lazySingleton<_i37.CacheDataSource>(() =>
      _i38.SharedPreferencesCacheDataSource(get<_i29.SharedPreferences>()));
  gh.lazySingleton<_i39.IBankDetailsRepo>(
      () => _i40.BankDetailsRepoImpl(get<_i35.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i41.IBusinessDetailsRepo>(() =>
      _i42.BusinessDetailsRepoImpl(get<_i36.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i43.IYarnRepo>(
      () => _i44.YarnRepoImpl(get<_i34.YarnCrudDataSource>()));
  gh.factory<_i45.UpdateUserBankDetails>(
      () => _i45.UpdateUserBankDetails(get<_i39.IBankDetailsRepo>()));
  gh.lazySingleton<_i46.UpdateUserBusinessDetails>(
      () => _i46.UpdateUserBusinessDetails(get<_i41.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i47.UserCacheDataSource>(
      () => _i47.UserCacheDataSource(get<_i37.CacheDataSource>()));
  gh.lazySingleton<_i48.AddYarnRequirement>(
      () => _i48.AddYarnRequirement(get<_i43.IYarnRepo>()));
  gh.lazySingleton<_i49.FetchSavedUserBankDetails>(
      () => _i49.FetchSavedUserBankDetails(get<_i39.IBankDetailsRepo>()));
  gh.lazySingleton<_i50.FetchSavedUserBusinessDetails>(() =>
      _i50.FetchSavedUserBusinessDetails(get<_i41.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i51.FetchYarnByCategory>(
      () => _i51.FetchYarnByCategory(get<_i43.IYarnRepo>()));
  gh.lazySingleton<_i52.FetchYarnsOfUser>(
      () => _i52.FetchYarnsOfUser(get<_i43.IYarnRepo>()));
  gh.lazySingleton<_i53.IUserRepo>(() => _i54.UserRepoImpl(
      get<_i33.UserCrudDatasource>(), get<_i47.UserCacheDataSource>()));
  gh.lazySingleton<_i55.LoadLoggedInUser>(
      () => _i55.LoadLoggedInUser(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i56.LoginUser>(() => _i56.LoginUser(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i57.UpdateUserBasicInfo>(
      () => _i57.UpdateUserBasicInfo(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i58.AddNewUser>(
      () => _i58.AddNewUser(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i59.CacheLoggedInUser>(
      () => _i59.CacheLoggedInUser(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i60.ClearLoggedInUser>(
      () => _i60.ClearLoggedInUser(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i61.FetchSavedUserBasicInformation>(
      () => _i61.FetchSavedUserBasicInformation(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i62.FetchUsersById>(
      () => _i62.FetchUsersById(get<_i53.IUserRepo>()));
  gh.lazySingleton<_i63.FetchUsersByType>(
      () => _i63.FetchUsersByType(get<_i53.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i64.RegisterModule {}
