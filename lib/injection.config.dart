// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i33;

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
import 'application/profile/profile_bloc.dart' as _i28;
import 'application/select_option/select_option_bloc.dart' as _i32;
import 'application/sign_in/sign_in_bloc.dart' as _i34;
import 'application/sign_up/sign_up_bloc.dart' as _i35;
import 'application/splash/splash_bloc.dart' as _i36;
import 'domain/ports/bank_details_repo.dart' as _i44;
import 'domain/ports/business_details_repo.dart' as _i46;
import 'domain/ports/firebase_repo.dart' as _i26;
import 'domain/ports/user_repo.dart' as _i58;
import 'domain/ports/yarn_repo.dart' as _i48;
import 'domain/use_cases/add_new_user.dart' as _i63;
import 'domain/use_cases/add_yarn_requirement.dart' as _i53;
import 'domain/use_cases/cache_logged_in_user.dart' as _i64;
import 'domain/use_cases/check_phone_number.dart' as _i65;
import 'domain/use_cases/clear_logged_in_user.dart' as _i66;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i54;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i67;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i55;
import 'domain/use_cases/fetch_user_by_id.dart' as _i68;
import 'domain/use_cases/fetch_users_by_type.dart' as _i69;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i56;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i57;
import 'domain/use_cases/load_logged_in_user.dart' as _i60;
import 'domain/use_cases/request_firebase_phone_auth_code.dart' as _i29;
import 'domain/use_cases/sign_in_user.dart' as _i61;
import 'domain/use_cases/update_user_bank_details.dart' as _i50;
import 'domain/use_cases/update_user_basic_info.dart' as _i62;
import 'domain/use_cases/update_user_business_details.dart' as _i51;
import 'domain/use_cases/verify_firebase_phone_auth_code.dart' as _i38;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i40;
import 'infrastructure/datasources/business_details_datasource.dart' as _i41;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i42;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i43;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i31;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i30;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i52;
import 'infrastructure/datasources/user_remote_datasource.dart' as _i37;
import 'infrastructure/datasources/yarn_datasource.dart' as _i39;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i45;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i47;
import 'infrastructure/repos/firebase_repo_impl.dart' as _i27;
import 'infrastructure/repos/user_repo_impl.dart' as _i59;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i49;
import 'injection.dart' as _i70; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AddYarnRequirementBloc>(
      () => _i3.AddYarnRequirementBloc());
  gh.lazySingleton<_i4.BottomNavigationBloc>(() => _i4.BottomNavigationBloc());
  gh.lazySingleton<_i5.EditBankDetailsBloc>(() => _i5.EditBankDetailsBloc());
  gh.lazySingleton<_i6.EditBasicInformationBloc>(
      () => _i6.EditBasicInformationBloc());
  gh.lazySingleton<_i7.EditBusinessDetailsBloc>(
      () => _i7.EditBusinessDetailsBloc());
  gh.lazySingleton<_i8.EditPasswordBloc>(() => _i8.EditPasswordBloc());
  gh.lazySingleton<_i9.FetchAllUsersBloc>(() => _i9.FetchAllUsersBloc());
  gh.lazySingleton<_i10.FetchAllYarnsBloc>(() => _i10.FetchAllYarnsBloc());
  gh.lazySingleton<_i11.FetchBrokerUsersBloc>(
      () => _i11.FetchBrokerUsersBloc());
  gh.lazySingleton<_i12.FetchCottonYarnsBloc>(
      () => _i12.FetchCottonYarnsBloc());
  gh.lazySingleton<_i13.FetchCpYarnsBloc>(() => _i13.FetchCpYarnsBloc());
  gh.lazySingleton<_i14.FetchFancyYarnsBloc>(() => _i14.FetchFancyYarnsBloc());
  gh.lazySingleton<_i15.FetchLinenYarnsBloc>(() => _i15.FetchLinenYarnsBloc());
  gh.lazySingleton<_i16.FetchMillUsersBloc>(() => _i16.FetchMillUsersBloc());
  gh.lazySingleton<_i17.FetchModalYarnsBloc>(() => _i17.FetchModalYarnsBloc());
  gh.lazySingleton<_i18.FetchPcYarnsBloc>(() => _i18.FetchPcYarnsBloc());
  gh.lazySingleton<_i19.FetchPsfYarnsBloc>(() => _i19.FetchPsfYarnsBloc());
  gh.lazySingleton<_i20.FetchPvYarnsBloc>(() => _i20.FetchPvYarnsBloc());
  gh.lazySingleton<_i21.FetchRayonYarnsBloc>(() => _i21.FetchRayonYarnsBloc());
  gh.lazySingleton<_i22.FetchTexturizeYarnsBloc>(
      () => _i22.FetchTexturizeYarnsBloc());
  gh.lazySingleton<_i23.FetchTraderUsersBloc>(
      () => _i23.FetchTraderUsersBloc());
  gh.lazySingleton<_i24.FetchViscoseYarnsBloc>(
      () => _i24.FetchViscoseYarnsBloc());
  gh.lazySingleton<_i25.FetchWorstedWoolYarnsBloc>(
      () => _i25.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i26.IFirebaseRepo>(() => _i27.FireBaseRepo());
  gh.lazySingleton<_i28.ProfileBloc>(() => _i28.ProfileBloc());
  gh.lazySingleton<_i29.RequestFirebasePhoneAuthCode>(
      () => _i29.RequestFirebasePhoneAuthCode(get<_i26.IFirebaseRepo>()));
  gh.lazySingleton<_i30.RestDataSource>(() => _i31.DioRestDataSource());
  gh.lazySingleton<_i32.SelectOptionBloc>(() => _i32.SelectOptionBloc());
  await gh.factoryAsync<_i33.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i34.SignInBloc>(() => _i34.SignInBloc());
  gh.lazySingleton<_i35.SignUpBloc>(() => _i35.SignUpBloc());
  gh.lazySingleton<_i36.SplashBloc>(() => _i36.SplashBloc());
  gh.lazySingleton<_i37.UserCrudDatasource>(
      () => _i37.UserLoopbackDatasource(get<_i30.RestDataSource>()));
  gh.lazySingleton<_i38.VerifyFirebasePhoneAuthCode>(
      () => _i38.VerifyFirebasePhoneAuthCode(get<_i26.IFirebaseRepo>()));
  gh.lazySingleton<_i39.YarnCrudDataSource>(
      () => _i39.YarnLoopbackDatasource(get<_i30.RestDataSource>()));
  gh.lazySingleton<_i40.BankDetailsCrudDatasource>(
      () => _i40.BankDetailsLoopbackDatasource(get<_i30.RestDataSource>()));
  gh.lazySingleton<_i41.BusinessDetailsCrudDatasource>(
      () => _i41.BusinessDetailsLoopbackDatasource(get<_i30.RestDataSource>()));
  gh.lazySingleton<_i42.CacheDataSource>(() =>
      _i43.SharedPreferencesCacheDataSource(get<_i33.SharedPreferences>()));
  gh.lazySingleton<_i44.IBankDetailsRepo>(
      () => _i45.BankDetailsRepoImpl(get<_i40.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i46.IBusinessDetailsRepo>(() =>
      _i47.BusinessDetailsRepoImpl(get<_i41.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i48.IYarnRepo>(
      () => _i49.YarnRepoImpl(get<_i39.YarnCrudDataSource>()));
  gh.factory<_i50.UpdateUserBankDetails>(
      () => _i50.UpdateUserBankDetails(get<_i44.IBankDetailsRepo>()));
  gh.lazySingleton<_i51.UpdateUserBusinessDetails>(
      () => _i51.UpdateUserBusinessDetails(get<_i46.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i52.UserCacheDataSource>(
      () => _i52.UserCacheDataSource(get<_i42.CacheDataSource>()));
  gh.lazySingleton<_i53.AddYarnRequirement>(
      () => _i53.AddYarnRequirement(get<_i48.IYarnRepo>()));
  gh.lazySingleton<_i54.FetchSavedUserBankDetails>(
      () => _i54.FetchSavedUserBankDetails(get<_i44.IBankDetailsRepo>()));
  gh.lazySingleton<_i55.FetchSavedUserBusinessDetails>(() =>
      _i55.FetchSavedUserBusinessDetails(get<_i46.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i56.FetchYarnByCategory>(
      () => _i56.FetchYarnByCategory(get<_i48.IYarnRepo>()));
  gh.lazySingleton<_i57.FetchYarnsOfUser>(
      () => _i57.FetchYarnsOfUser(get<_i48.IYarnRepo>()));
  gh.lazySingleton<_i58.IUserRepo>(() => _i59.UserRepoImpl(
      get<_i37.UserCrudDatasource>(), get<_i52.UserCacheDataSource>()));
  gh.lazySingleton<_i60.LoadLoggedInUser>(
      () => _i60.LoadLoggedInUser(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i61.SignInUser>(
      () => _i61.SignInUser(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i62.UpdateUserBasicInfo>(
      () => _i62.UpdateUserBasicInfo(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i63.AddNewUser>(
      () => _i63.AddNewUser(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i64.CacheLoggedInUser>(
      () => _i64.CacheLoggedInUser(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i65.CheckPhoneNumber>(
      () => _i65.CheckPhoneNumber(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i66.ClearLoggedInUser>(
      () => _i66.ClearLoggedInUser(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i67.FetchSavedUserBasicInformation>(
      () => _i67.FetchSavedUserBasicInformation(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i68.FetchUsersById>(
      () => _i68.FetchUsersById(get<_i58.IUserRepo>()));
  gh.lazySingleton<_i69.FetchUsersByType>(
      () => _i69.FetchUsersByType(get<_i58.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i70.RegisterModule {}
