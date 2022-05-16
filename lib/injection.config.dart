// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i34;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/bottom_navigation/bottom_navigation_bloc.dart' as _i4;
import 'application/composed_yarn/composed_yarn_bloc.dart' as _i5;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i6;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i7;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i8;
import 'application/edit_password/edit_password_bloc.dart' as _i9;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i10;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i12;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i17;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i24;
import 'application/fetch_yarns_all/fetch_all_yarns_bloc.dart' as _i11;
import 'application/fetch_yarns_cotton/fetch_cotton_yarns_bloc.dart' as _i13;
import 'application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart' as _i14;
import 'application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart' as _i15;
import 'application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart' as _i16;
import 'application/fetch_yarns_modal/fetch_modal_yarns_bloc.dart' as _i18;
import 'application/fetch_yarns_pc/fetch_pc_yarns_bloc.dart' as _i19;
import 'application/fetch_yarns_psf/fetch_psf_yarns_bloc.dart' as _i20;
import 'application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart' as _i21;
import 'application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart' as _i22;
import 'application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart'
    as _i23;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i25;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i26;
import 'application/profile/profile_bloc.dart' as _i29;
import 'application/select_option/select_option_bloc.dart' as _i33;
import 'application/sign_in/sign_in_bloc.dart' as _i35;
import 'application/sign_up/sign_up_bloc.dart' as _i36;
import 'application/splash/splash_bloc.dart' as _i37;
import 'domain/ports/bank_details_repo.dart' as _i45;
import 'domain/ports/business_details_repo.dart' as _i47;
import 'domain/ports/firebase_repo.dart' as _i27;
import 'domain/ports/user_repo.dart' as _i59;
import 'domain/ports/yarn_repo.dart' as _i49;
import 'domain/use_cases/add_new_user.dart' as _i64;
import 'domain/use_cases/add_yarn_requirement.dart' as _i54;
import 'domain/use_cases/cache_logged_in_user.dart' as _i65;
import 'domain/use_cases/check_phone_number.dart' as _i66;
import 'domain/use_cases/clear_logged_in_user.dart' as _i67;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i55;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i68;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i56;
import 'domain/use_cases/fetch_user_by_id.dart' as _i69;
import 'domain/use_cases/fetch_users_by_type.dart' as _i70;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i57;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i58;
import 'domain/use_cases/load_logged_in_user.dart' as _i61;
import 'domain/use_cases/request_firebase_phone_auth_code.dart' as _i30;
import 'domain/use_cases/sign_in_user.dart' as _i62;
import 'domain/use_cases/update_user_bank_details.dart' as _i51;
import 'domain/use_cases/update_user_basic_info.dart' as _i63;
import 'domain/use_cases/update_user_business_details.dart' as _i52;
import 'domain/use_cases/verify_firebase_phone_auth_code.dart' as _i39;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i41;
import 'infrastructure/datasources/business_details_datasource.dart' as _i42;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i43;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i44;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i32;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i31;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i53;
import 'infrastructure/datasources/user_remote_datasource.dart' as _i38;
import 'infrastructure/datasources/yarn_datasource.dart' as _i40;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i46;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i48;
import 'infrastructure/repos/firebase_repo_impl.dart' as _i28;
import 'infrastructure/repos/user_repo_impl.dart' as _i60;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i50;
import 'injection.dart' as _i71; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AddYarnRequirementBloc>(
      () => _i3.AddYarnRequirementBloc());
  gh.lazySingleton<_i4.BottomNavigationBloc>(() => _i4.BottomNavigationBloc());
  gh.lazySingleton<_i5.ComposedYarnBloc>(() => _i5.ComposedYarnBloc());
  gh.lazySingleton<_i6.EditBankDetailsBloc>(() => _i6.EditBankDetailsBloc());
  gh.lazySingleton<_i7.EditBasicInformationBloc>(
      () => _i7.EditBasicInformationBloc());
  gh.lazySingleton<_i8.EditBusinessDetailsBloc>(
      () => _i8.EditBusinessDetailsBloc());
  gh.lazySingleton<_i9.EditPasswordBloc>(() => _i9.EditPasswordBloc());
  gh.lazySingleton<_i10.FetchAllUsersBloc>(() => _i10.FetchAllUsersBloc());
  gh.lazySingleton<_i11.FetchAllYarnsBloc>(() => _i11.FetchAllYarnsBloc());
  gh.lazySingleton<_i12.FetchBrokerUsersBloc>(
      () => _i12.FetchBrokerUsersBloc());
  gh.lazySingleton<_i13.FetchCottonYarnsBloc>(
      () => _i13.FetchCottonYarnsBloc());
  gh.lazySingleton<_i14.FetchCpYarnsBloc>(() => _i14.FetchCpYarnsBloc());
  gh.lazySingleton<_i15.FetchFancyYarnsBloc>(() => _i15.FetchFancyYarnsBloc());
  gh.lazySingleton<_i16.FetchLinenYarnsBloc>(() => _i16.FetchLinenYarnsBloc());
  gh.lazySingleton<_i17.FetchMillUsersBloc>(() => _i17.FetchMillUsersBloc());
  gh.lazySingleton<_i18.FetchModalYarnsBloc>(() => _i18.FetchModalYarnsBloc());
  gh.lazySingleton<_i19.FetchPcYarnsBloc>(() => _i19.FetchPcYarnsBloc());
  gh.lazySingleton<_i20.FetchPsfYarnsBloc>(() => _i20.FetchPsfYarnsBloc());
  gh.lazySingleton<_i21.FetchPvYarnsBloc>(() => _i21.FetchPvYarnsBloc());
  gh.lazySingleton<_i22.FetchRayonYarnsBloc>(() => _i22.FetchRayonYarnsBloc());
  gh.lazySingleton<_i23.FetchTexturizeYarnsBloc>(
      () => _i23.FetchTexturizeYarnsBloc());
  gh.lazySingleton<_i24.FetchTraderUsersBloc>(
      () => _i24.FetchTraderUsersBloc());
  gh.lazySingleton<_i25.FetchViscoseYarnsBloc>(
      () => _i25.FetchViscoseYarnsBloc());
  gh.lazySingleton<_i26.FetchWorstedWoolYarnsBloc>(
      () => _i26.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i27.IFirebaseRepo>(() => _i28.FireBaseRepo());
  gh.lazySingleton<_i29.ProfileBloc>(() => _i29.ProfileBloc());
  gh.lazySingleton<_i30.RequestFirebasePhoneAuthCode>(
      () => _i30.RequestFirebasePhoneAuthCode(get<_i27.IFirebaseRepo>()));
  gh.lazySingleton<_i31.RestDataSource>(() => _i32.DioRestDataSource());
  gh.lazySingleton<_i33.SelectOptionBloc>(() => _i33.SelectOptionBloc());
  await gh.factoryAsync<_i34.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i35.SignInBloc>(() => _i35.SignInBloc());
  gh.lazySingleton<_i36.SignUpBloc>(() => _i36.SignUpBloc());
  gh.lazySingleton<_i37.SplashBloc>(() => _i37.SplashBloc());
  gh.lazySingleton<_i38.UserCrudDatasource>(
      () => _i38.UserLoopbackDatasource(get<_i31.RestDataSource>()));
  gh.lazySingleton<_i39.VerifyFirebasePhoneAuthCode>(
      () => _i39.VerifyFirebasePhoneAuthCode(get<_i27.IFirebaseRepo>()));
  gh.lazySingleton<_i40.YarnCrudDataSource>(
      () => _i40.YarnLoopbackDatasource(get<_i31.RestDataSource>()));
  gh.lazySingleton<_i41.BankDetailsCrudDatasource>(
      () => _i41.BankDetailsLoopbackDatasource(get<_i31.RestDataSource>()));
  gh.lazySingleton<_i42.BusinessDetailsCrudDatasource>(
      () => _i42.BusinessDetailsLoopbackDatasource(get<_i31.RestDataSource>()));
  gh.lazySingleton<_i43.CacheDataSource>(() =>
      _i44.SharedPreferencesCacheDataSource(get<_i34.SharedPreferences>()));
  gh.lazySingleton<_i45.IBankDetailsRepo>(
      () => _i46.BankDetailsRepoImpl(get<_i41.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i47.IBusinessDetailsRepo>(() =>
      _i48.BusinessDetailsRepoImpl(get<_i42.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i49.IYarnRepo>(
      () => _i50.YarnRepoImpl(get<_i40.YarnCrudDataSource>()));
  gh.factory<_i51.UpdateUserBankDetails>(
      () => _i51.UpdateUserBankDetails(get<_i45.IBankDetailsRepo>()));
  gh.lazySingleton<_i52.UpdateUserBusinessDetails>(
      () => _i52.UpdateUserBusinessDetails(get<_i47.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i53.UserCacheDataSource>(
      () => _i53.UserCacheDataSource(get<_i43.CacheDataSource>()));
  gh.lazySingleton<_i54.AddYarnRequirement>(
      () => _i54.AddYarnRequirement(get<_i49.IYarnRepo>()));
  gh.lazySingleton<_i55.FetchSavedUserBankDetails>(
      () => _i55.FetchSavedUserBankDetails(get<_i45.IBankDetailsRepo>()));
  gh.lazySingleton<_i56.FetchSavedUserBusinessDetails>(() =>
      _i56.FetchSavedUserBusinessDetails(get<_i47.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i57.FetchYarnByCategory>(
      () => _i57.FetchYarnByCategory(get<_i49.IYarnRepo>()));
  gh.lazySingleton<_i58.FetchYarnsOfUser>(
      () => _i58.FetchYarnsOfUser(get<_i49.IYarnRepo>()));
  gh.lazySingleton<_i59.IUserRepo>(() => _i60.UserRepoImpl(
      get<_i38.UserCrudDatasource>(), get<_i53.UserCacheDataSource>()));
  gh.lazySingleton<_i61.LoadLoggedInUser>(
      () => _i61.LoadLoggedInUser(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i62.SignInUser>(
      () => _i62.SignInUser(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i63.UpdateUserBasicInfo>(
      () => _i63.UpdateUserBasicInfo(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i64.AddNewUser>(
      () => _i64.AddNewUser(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i65.CacheLoggedInUser>(
      () => _i65.CacheLoggedInUser(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i66.CheckPhoneNumber>(
      () => _i66.CheckPhoneNumber(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i67.ClearLoggedInUser>(
      () => _i67.ClearLoggedInUser(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i68.FetchSavedUserBasicInformation>(
      () => _i68.FetchSavedUserBasicInformation(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i69.FetchUsersById>(
      () => _i69.FetchUsersById(get<_i59.IUserRepo>()));
  gh.lazySingleton<_i70.FetchUsersByType>(
      () => _i70.FetchUsersByType(get<_i59.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i71.RegisterModule {}
