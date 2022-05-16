// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i36;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/bottom_navigation/bottom_navigation_bloc.dart' as _i4;
import 'application/composed_yarn/composed_yarn_bloc.dart' as _i5;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i6;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i7;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i8;
import 'application/edit_password/edit_password_bloc.dart' as _i9;
import 'application/fetch_similar_yarns/fetch_similar_yarns_bloc.dart' as _i23;
import 'application/fetch_user_yarns/fetch_user_yarns_bloc.dart' as _i26;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i10;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i12;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i17;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i25;
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
    as _i24;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i27;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i28;
import 'application/profile/profile_bloc.dart' as _i31;
import 'application/select_option/select_option_bloc.dart' as _i35;
import 'application/sign_in/sign_in_bloc.dart' as _i37;
import 'application/sign_up/sign_up_bloc.dart' as _i38;
import 'application/splash/splash_bloc.dart' as _i39;
import 'domain/ports/bank_details_repo.dart' as _i47;
import 'domain/ports/business_details_repo.dart' as _i49;
import 'domain/ports/firebase_repo.dart' as _i29;
import 'domain/ports/user_repo.dart' as _i62;
import 'domain/ports/yarn_repo.dart' as _i51;
import 'domain/use_cases/add_new_user.dart' as _i67;
import 'domain/use_cases/add_yarn_requirement.dart' as _i56;
import 'domain/use_cases/cache_logged_in_user.dart' as _i68;
import 'domain/use_cases/check_phone_number.dart' as _i69;
import 'domain/use_cases/clear_logged_in_user.dart' as _i70;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i57;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i71;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i58;
import 'domain/use_cases/fetch_user_by_id.dart' as _i72;
import 'domain/use_cases/fetch_user_yarns.dart' as _i59;
import 'domain/use_cases/fetch_users_by_type.dart' as _i73;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i60;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i61;
import 'domain/use_cases/load_logged_in_user.dart' as _i64;
import 'domain/use_cases/request_firebase_phone_auth_code.dart' as _i32;
import 'domain/use_cases/sign_in_user.dart' as _i65;
import 'domain/use_cases/update_user_bank_details.dart' as _i53;
import 'domain/use_cases/update_user_basic_info.dart' as _i66;
import 'domain/use_cases/update_user_business_details.dart' as _i54;
import 'domain/use_cases/verify_firebase_phone_auth_code.dart' as _i41;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i43;
import 'infrastructure/datasources/business_details_datasource.dart' as _i44;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i45;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i46;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i34;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i33;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i55;
import 'infrastructure/datasources/user_remote_datasource.dart' as _i40;
import 'infrastructure/datasources/yarn_datasource.dart' as _i42;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i48;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i50;
import 'infrastructure/repos/firebase_repo_impl.dart' as _i30;
import 'infrastructure/repos/user_repo_impl.dart' as _i63;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i52;
import 'injection.dart' as _i74; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i23.FetchSimilarYarnsBloc>(
      () => _i23.FetchSimilarYarnsBloc());
  gh.lazySingleton<_i24.FetchTexturizeYarnsBloc>(
      () => _i24.FetchTexturizeYarnsBloc());
  gh.lazySingleton<_i25.FetchTraderUsersBloc>(
      () => _i25.FetchTraderUsersBloc());
  gh.lazySingleton<_i26.FetchUserYarnsBloc>(() => _i26.FetchUserYarnsBloc());
  gh.lazySingleton<_i27.FetchViscoseYarnsBloc>(
      () => _i27.FetchViscoseYarnsBloc());
  gh.lazySingleton<_i28.FetchWorstedWoolYarnsBloc>(
      () => _i28.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i29.IFirebaseRepo>(() => _i30.FireBaseRepo());
  gh.lazySingleton<_i31.ProfileBloc>(() => _i31.ProfileBloc());
  gh.lazySingleton<_i32.RequestFirebasePhoneAuthCode>(
      () => _i32.RequestFirebasePhoneAuthCode(get<_i29.IFirebaseRepo>()));
  gh.lazySingleton<_i33.RestDataSource>(() => _i34.DioRestDataSource());
  gh.lazySingleton<_i35.SelectOptionBloc>(() => _i35.SelectOptionBloc());
  await gh.factoryAsync<_i36.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i37.SignInBloc>(() => _i37.SignInBloc());
  gh.lazySingleton<_i38.SignUpBloc>(() => _i38.SignUpBloc());
  gh.lazySingleton<_i39.SplashBloc>(() => _i39.SplashBloc());
  gh.lazySingleton<_i40.UserCrudDatasource>(
      () => _i40.UserLoopbackDatasource(get<_i33.RestDataSource>()));
  gh.lazySingleton<_i41.VerifyFirebasePhoneAuthCode>(
      () => _i41.VerifyFirebasePhoneAuthCode(get<_i29.IFirebaseRepo>()));
  gh.lazySingleton<_i42.YarnCrudDataSource>(
      () => _i42.YarnLoopbackDatasource(get<_i33.RestDataSource>()));
  gh.lazySingleton<_i43.BankDetailsCrudDatasource>(
      () => _i43.BankDetailsLoopbackDatasource(get<_i33.RestDataSource>()));
  gh.lazySingleton<_i44.BusinessDetailsCrudDatasource>(
      () => _i44.BusinessDetailsLoopbackDatasource(get<_i33.RestDataSource>()));
  gh.lazySingleton<_i45.CacheDataSource>(() =>
      _i46.SharedPreferencesCacheDataSource(get<_i36.SharedPreferences>()));
  gh.lazySingleton<_i47.IBankDetailsRepo>(
      () => _i48.BankDetailsRepoImpl(get<_i43.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i49.IBusinessDetailsRepo>(() =>
      _i50.BusinessDetailsRepoImpl(get<_i44.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i51.IYarnRepo>(
      () => _i52.YarnRepoImpl(get<_i42.YarnCrudDataSource>()));
  gh.factory<_i53.UpdateUserBankDetails>(
      () => _i53.UpdateUserBankDetails(get<_i47.IBankDetailsRepo>()));
  gh.lazySingleton<_i54.UpdateUserBusinessDetails>(
      () => _i54.UpdateUserBusinessDetails(get<_i49.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i55.UserCacheDataSource>(
      () => _i55.UserCacheDataSource(get<_i45.CacheDataSource>()));
  gh.lazySingleton<_i56.AddYarnRequirement>(
      () => _i56.AddYarnRequirement(get<_i51.IYarnRepo>()));
  gh.lazySingleton<_i57.FetchSavedUserBankDetails>(
      () => _i57.FetchSavedUserBankDetails(get<_i47.IBankDetailsRepo>()));
  gh.lazySingleton<_i58.FetchSavedUserBusinessDetails>(() =>
      _i58.FetchSavedUserBusinessDetails(get<_i49.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i59.FetchUserYarns>(
      () => _i59.FetchUserYarns(get<_i51.IYarnRepo>()));
  gh.lazySingleton<_i60.FetchYarnByCategory>(
      () => _i60.FetchYarnByCategory(get<_i51.IYarnRepo>()));
  gh.lazySingleton<_i61.FetchYarnsOfUser>(
      () => _i61.FetchYarnsOfUser(get<_i51.IYarnRepo>()));
  gh.lazySingleton<_i62.IUserRepo>(() => _i63.UserRepoImpl(
      get<_i40.UserCrudDatasource>(), get<_i55.UserCacheDataSource>()));
  gh.lazySingleton<_i64.LoadLoggedInUser>(
      () => _i64.LoadLoggedInUser(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i65.SignInUser>(
      () => _i65.SignInUser(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i66.UpdateUserBasicInfo>(
      () => _i66.UpdateUserBasicInfo(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i67.AddNewUser>(
      () => _i67.AddNewUser(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i68.CacheLoggedInUser>(
      () => _i68.CacheLoggedInUser(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i69.CheckPhoneNumber>(
      () => _i69.CheckPhoneNumber(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i70.ClearLoggedInUser>(
      () => _i70.ClearLoggedInUser(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i71.FetchSavedUserBasicInformation>(
      () => _i71.FetchSavedUserBasicInformation(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i72.FetchUsersById>(
      () => _i72.FetchUsersById(get<_i62.IUserRepo>()));
  gh.lazySingleton<_i73.FetchUsersByType>(
      () => _i73.FetchUsersByType(get<_i62.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i74.RegisterModule {}
