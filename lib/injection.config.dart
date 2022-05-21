// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i42;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/bottom_navigation/bottom_navigation_bloc.dart' as _i4;
import 'application/composed_yarn/composed_yarn_bloc.dart' as _i5;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i10;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i11;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i12;
import 'application/edit_password/edit_password_bloc.dart' as _i13;
import 'application/fetch_similar_yarns/fetch_similar_yarns_bloc.dart' as _i27;
import 'application/fetch_user_yarns/fetch_user_yarns_bloc.dart' as _i30;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i14;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i16;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i21;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i29;
import 'application/fetch_yarns_all/fetch_all_yarns_bloc.dart' as _i15;
import 'application/fetch_yarns_cotton/fetch_cotton_yarns_bloc.dart' as _i17;
import 'application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart' as _i18;
import 'application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart' as _i19;
import 'application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart' as _i20;
import 'application/fetch_yarns_modal/fetch_modal_yarns_bloc.dart' as _i22;
import 'application/fetch_yarns_pc/fetch_pc_yarns_bloc.dart' as _i23;
import 'application/fetch_yarns_psf/fetch_psf_yarns_bloc.dart' as _i24;
import 'application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart' as _i25;
import 'application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart' as _i26;
import 'application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart'
    as _i28;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i31;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i32;
import 'application/profile/profile_bloc.dart' as _i37;
import 'application/select_option/select_option_bloc.dart' as _i41;
import 'application/sign_in/sign_in_bloc.dart' as _i43;
import 'application/sign_up/sign_up_bloc.dart' as _i44;
import 'application/splash/splash_bloc.dart' as _i45;
import 'application/suggestion/suggestion_bloc.dart' as _i46;
import 'config/config.dart' as _i6;
import 'config/develoment.config.dart' as _i9;
import 'config/production.config.dart' as _i8;
import 'config/staging.config.dart' as _i7;
import 'domain/ports/bank_details_repo.dart' as _i56;
import 'domain/ports/business_details_repo.dart' as _i58;
import 'domain/ports/file_repo.dart' as _i34;
import 'domain/ports/firebase_repo.dart' as _i35;
import 'domain/ports/suggestion_repo.dart' as _i60;
import 'domain/ports/user_repo.dart' as _i74;
import 'domain/ports/yarn_repo.dart' as _i62;
import 'domain/use_cases/add_new_user.dart' as _i79;
import 'domain/use_cases/add_suggestion.dart' as _i67;
import 'domain/use_cases/add_yarn_requirement.dart' as _i68;
import 'domain/use_cases/cache_logged_in_user.dart' as _i80;
import 'domain/use_cases/check_phone_number.dart' as _i81;
import 'domain/use_cases/clear_logged_in_user.dart' as _i82;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i69;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i83;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i70;
import 'domain/use_cases/fetch_user_by_id.dart' as _i84;
import 'domain/use_cases/fetch_user_yarns.dart' as _i71;
import 'domain/use_cases/fetch_users_by_type.dart' as _i85;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i72;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i73;
import 'domain/use_cases/get_file_download_link.dart' as _i33;
import 'domain/use_cases/load_logged_in_user.dart' as _i76;
import 'domain/use_cases/request_firebase_phone_auth_code.dart' as _i38;
import 'domain/use_cases/sign_in_user.dart' as _i77;
import 'domain/use_cases/update_user_bank_details.dart' as _i64;
import 'domain/use_cases/update_user_basic_info.dart' as _i78;
import 'domain/use_cases/update_user_business_details.dart' as _i65;
import 'domain/use_cases/verify_firebase_phone_auth_code.dart' as _i49;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i51;
import 'infrastructure/datasources/business_details_datasource.dart' as _i52;
import 'infrastructure/datasources/file_datasource.dart' as _i55;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i53;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i54;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i40;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i39;
import 'infrastructure/datasources/suggestion_datasource.dart' as _i47;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i66;
import 'infrastructure/datasources/user_remote_datasource.dart' as _i48;
import 'infrastructure/datasources/yarn_datasource.dart' as _i50;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i57;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i59;
import 'infrastructure/repos/firebase_repo_impl.dart' as _i36;
import 'infrastructure/repos/suggestion_repo_impl.dart' as _i61;
import 'infrastructure/repos/user_repo_impl.dart' as _i75;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i63;
import 'injection.dart' as _i86;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';
// ignore_for_file: unnecessary_lambdas
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
  gh.lazySingleton<_i6.Config>(() => _i7.StagingConfig(),
      registerFor: {_staging});
  gh.lazySingleton<_i6.Config>(() => _i8.ProductionConfig(),
      registerFor: {_production});
  gh.lazySingleton<_i6.Config>(() => _i9.DevelopmentConfig(),
      registerFor: {_development});
  gh.lazySingleton<_i10.EditBankDetailsBloc>(() => _i10.EditBankDetailsBloc());
  gh.lazySingleton<_i11.EditBasicInformationBloc>(
      () => _i11.EditBasicInformationBloc());
  gh.lazySingleton<_i12.EditBusinessDetailsBloc>(
      () => _i12.EditBusinessDetailsBloc());
  gh.lazySingleton<_i13.EditPasswordBloc>(() => _i13.EditPasswordBloc());
  gh.lazySingleton<_i14.FetchAllUsersBloc>(() => _i14.FetchAllUsersBloc());
  gh.lazySingleton<_i15.FetchAllYarnsBloc>(() => _i15.FetchAllYarnsBloc());
  gh.lazySingleton<_i16.FetchBrokerUsersBloc>(
      () => _i16.FetchBrokerUsersBloc());
  gh.lazySingleton<_i17.FetchCottonYarnsBloc>(
      () => _i17.FetchCottonYarnsBloc());
  gh.lazySingleton<_i18.FetchCpYarnsBloc>(() => _i18.FetchCpYarnsBloc());
  gh.lazySingleton<_i19.FetchFancyYarnsBloc>(() => _i19.FetchFancyYarnsBloc());
  gh.lazySingleton<_i20.FetchLinenYarnsBloc>(() => _i20.FetchLinenYarnsBloc());
  gh.lazySingleton<_i21.FetchMillUsersBloc>(() => _i21.FetchMillUsersBloc());
  gh.lazySingleton<_i22.FetchModalYarnsBloc>(() => _i22.FetchModalYarnsBloc());
  gh.lazySingleton<_i23.FetchPcYarnsBloc>(() => _i23.FetchPcYarnsBloc());
  gh.lazySingleton<_i24.FetchPsfYarnsBloc>(() => _i24.FetchPsfYarnsBloc());
  gh.lazySingleton<_i25.FetchPvYarnsBloc>(() => _i25.FetchPvYarnsBloc());
  gh.lazySingleton<_i26.FetchRayonYarnsBloc>(() => _i26.FetchRayonYarnsBloc());
  gh.lazySingleton<_i27.FetchSimilarYarnsBloc>(
      () => _i27.FetchSimilarYarnsBloc());
  gh.lazySingleton<_i28.FetchTexturizeYarnsBloc>(
      () => _i28.FetchTexturizeYarnsBloc());
  gh.lazySingleton<_i29.FetchTraderUsersBloc>(
      () => _i29.FetchTraderUsersBloc());
  gh.lazySingleton<_i30.FetchUserYarnsBloc>(() => _i30.FetchUserYarnsBloc());
  gh.lazySingleton<_i31.FetchViscoseYarnsBloc>(
      () => _i31.FetchViscoseYarnsBloc());
  gh.lazySingleton<_i32.FetchWorstedWoolYarnsBloc>(
      () => _i32.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i33.GetFileDownloadLink>(
      () => _i33.GetFileDownloadLink(get<_i34.IFileRepo>()));
  gh.lazySingleton<_i35.IFirebaseRepo>(() => _i36.FireBaseRepo());
  gh.lazySingleton<_i37.ProfileBloc>(() => _i37.ProfileBloc());
  gh.lazySingleton<_i38.RequestFirebasePhoneAuthCode>(
      () => _i38.RequestFirebasePhoneAuthCode(get<_i35.IFirebaseRepo>()));
  gh.lazySingleton<_i39.RestDataSource>(
      () => _i40.DioRestDataSource(get<_i6.Config>()));
  gh.lazySingleton<_i41.SelectOptionBloc>(() => _i41.SelectOptionBloc());
  await gh.factoryAsync<_i42.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i43.SignInBloc>(() => _i43.SignInBloc());
  gh.lazySingleton<_i44.SignUpBloc>(() => _i44.SignUpBloc());
  gh.lazySingleton<_i45.SplashBloc>(() => _i45.SplashBloc());
  gh.lazySingleton<_i46.SuggestionBloc>(() => _i46.SuggestionBloc());
  gh.lazySingleton<_i47.SuggestionCrudDatasource>(
      () => _i47.SuggestionLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i48.UserCrudDatasource>(
      () => _i48.UserLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i49.VerifyFirebasePhoneAuthCode>(
      () => _i49.VerifyFirebasePhoneAuthCode(get<_i35.IFirebaseRepo>()));
  gh.lazySingleton<_i50.YarnCrudDataSource>(
      () => _i50.YarnLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i51.BankDetailsCrudDatasource>(
      () => _i51.BankDetailsLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i52.BusinessDetailsCrudDatasource>(
      () => _i52.BusinessDetailsLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i53.CacheDataSource>(() =>
      _i54.SharedPreferencesCacheDataSource(get<_i42.SharedPreferences>()));
  gh.lazySingleton<_i55.FileCrudDatasource>(
      () => _i55.FileLoopbackDatasource(get<_i39.RestDataSource>()));
  gh.lazySingleton<_i56.IBankDetailsRepo>(
      () => _i57.BankDetailsRepoImpl(get<_i51.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i58.IBusinessDetailsRepo>(() =>
      _i59.BusinessDetailsRepoImpl(get<_i52.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i60.ISuggestionRepo>(
      () => _i61.SuggestionRepoImpl(get<_i47.SuggestionCrudDatasource>()));
  gh.lazySingleton<_i62.IYarnRepo>(
      () => _i63.YarnRepoImpl(get<_i50.YarnCrudDataSource>()));
  gh.factory<_i64.UpdateUserBankDetails>(
      () => _i64.UpdateUserBankDetails(get<_i56.IBankDetailsRepo>()));
  gh.lazySingleton<_i65.UpdateUserBusinessDetails>(
      () => _i65.UpdateUserBusinessDetails(get<_i58.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i66.UserCacheDataSource>(
      () => _i66.UserCacheDataSource(get<_i53.CacheDataSource>()));
  gh.lazySingleton<_i67.AddSuggestion>(
      () => _i67.AddSuggestion(get<_i60.ISuggestionRepo>()));
  gh.lazySingleton<_i68.AddYarnRequirement>(
      () => _i68.AddYarnRequirement(get<_i62.IYarnRepo>()));
  gh.lazySingleton<_i69.FetchSavedUserBankDetails>(
      () => _i69.FetchSavedUserBankDetails(get<_i56.IBankDetailsRepo>()));
  gh.lazySingleton<_i70.FetchSavedUserBusinessDetails>(() =>
      _i70.FetchSavedUserBusinessDetails(get<_i58.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i71.FetchUserYarns>(
      () => _i71.FetchUserYarns(get<_i62.IYarnRepo>()));
  gh.lazySingleton<_i72.FetchYarnByCategory>(
      () => _i72.FetchYarnByCategory(get<_i62.IYarnRepo>()));
  gh.lazySingleton<_i73.FetchYarnsOfUser>(
      () => _i73.FetchYarnsOfUser(get<_i62.IYarnRepo>()));
  gh.lazySingleton<_i74.IUserRepo>(() => _i75.UserRepoImpl(
      get<_i48.UserCrudDatasource>(), get<_i66.UserCacheDataSource>()));
  gh.lazySingleton<_i76.LoadLoggedInUser>(
      () => _i76.LoadLoggedInUser(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i77.SignInUser>(
      () => _i77.SignInUser(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i78.UpdateUserBasicInfo>(
      () => _i78.UpdateUserBasicInfo(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i79.AddNewUser>(
      () => _i79.AddNewUser(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i80.CacheLoggedInUser>(
      () => _i80.CacheLoggedInUser(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i81.CheckPhoneNumber>(
      () => _i81.CheckPhoneNumber(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i82.ClearLoggedInUser>(
      () => _i82.ClearLoggedInUser(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i83.FetchSavedUserBasicInformation>(
      () => _i83.FetchSavedUserBasicInformation(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i84.FetchUsersById>(
      () => _i84.FetchUsersById(get<_i74.IUserRepo>()));
  gh.lazySingleton<_i85.FetchUsersByType>(
      () => _i85.FetchUsersByType(get<_i74.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i86.RegisterModule {}
