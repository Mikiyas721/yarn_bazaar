// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i45;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/bottom_navigation/bottom_navigation_bloc.dart' as _i4;
import 'application/composed_yarn/composed_yarn_bloc.dart' as _i5;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i12;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i13;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i14;
import 'application/edit_password/edit_password_bloc.dart' as _i15;
import 'application/fetch_similar_yarns/fetch_similar_yarns_bloc.dart' as _i29;
import 'application/fetch_user_yarns/fetch_user_yarns_bloc.dart' as _i32;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i16;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i18;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i23;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i31;
import 'application/fetch_yarns_all/fetch_all_yarns_bloc.dart' as _i17;
import 'application/fetch_yarns_cotton/fetch_cotton_yarns_bloc.dart' as _i19;
import 'application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart' as _i20;
import 'application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart' as _i21;
import 'application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart' as _i22;
import 'application/fetch_yarns_modal/fetch_modal_yarns_bloc.dart' as _i24;
import 'application/fetch_yarns_pc/fetch_pc_yarns_bloc.dart' as _i25;
import 'application/fetch_yarns_psf/fetch_psf_yarns_bloc.dart' as _i26;
import 'application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart' as _i27;
import 'application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart' as _i28;
import 'application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart'
    as _i30;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i33;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i34;
import 'application/forgot_password/forgot_password_bloc.dart' as _i35;
import 'application/profile/profile_bloc.dart' as _i39;
import 'application/reset_password/reset_password_bloc.dart' as _i41;
import 'application/select_option/select_option_bloc.dart' as _i44;
import 'application/sign_in/sign_in_bloc.dart' as _i46;
import 'application/sign_up/sign_up_bloc.dart' as _i47;
import 'application/splash/splash_bloc.dart' as _i48;
import 'application/suggestion/suggestion_bloc.dart' as _i49;
import 'config/config.dart' as _i6;
import 'config/develoment.config.dart' as _i7;
import 'config/production.config.dart' as _i8;
import 'config/staging.config.dart' as _i9;
import 'domain/ports/bank_details_repo.dart' as _i60;
import 'domain/ports/business_details_repo.dart' as _i62;
import 'domain/ports/file_repo.dart' as _i11;
import 'domain/ports/firebase_repo.dart' as _i37;
import 'domain/ports/suggestion_repo.dart' as _i64;
import 'domain/ports/user_repo.dart' as _i78;
import 'domain/ports/yarn_repo.dart' as _i66;
import 'domain/use_cases/add_new_user.dart' as _i83;
import 'domain/use_cases/add_suggestion.dart' as _i71;
import 'domain/use_cases/add_yarn_requirement.dart' as _i72;
import 'domain/use_cases/cache_logged_in_user.dart' as _i84;
import 'domain/use_cases/check_phone_number.dart' as _i85;
import 'domain/use_cases/clear_logged_in_user.dart' as _i86;
import 'domain/use_cases/delete_file.dart' as _i10;
import 'domain/use_cases/fetch_saved_user_bank_details.dart' as _i73;
import 'domain/use_cases/fetch_saved_user_basic_information.dart' as _i87;
import 'domain/use_cases/fetch_saved_user_business_details.dart' as _i74;
import 'domain/use_cases/fetch_user_basic_information_by_phone_number.dart'
    as _i88;
import 'domain/use_cases/fetch_user_by_id.dart' as _i89;
import 'domain/use_cases/fetch_user_yarns.dart' as _i75;
import 'domain/use_cases/fetch_users_by_type.dart' as _i90;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i76;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i77;
import 'domain/use_cases/get_file_download_link.dart' as _i36;
import 'domain/use_cases/load_logged_in_user.dart' as _i80;
import 'domain/use_cases/request_firebase_phone_auth_code.dart' as _i40;
import 'domain/use_cases/sign_in_user.dart' as _i81;
import 'domain/use_cases/update_user_bank_details.dart' as _i68;
import 'domain/use_cases/update_user_basic_info.dart' as _i82;
import 'domain/use_cases/update_user_business_details.dart' as _i69;
import 'domain/use_cases/upload_file.dart' as _i51;
import 'domain/use_cases/verify_firebase_phone_auth_code.dart' as _i53;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i55;
import 'infrastructure/datasources/business_details_datasource.dart' as _i56;
import 'infrastructure/datasources/file_datasource.dart' as _i59;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i57;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i58;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i43;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i42;
import 'infrastructure/datasources/suggestion_datasource.dart' as _i50;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i70;
import 'infrastructure/datasources/user_remote_datasource.dart' as _i52;
import 'infrastructure/datasources/yarn_datasource.dart' as _i54;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i61;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i63;
import 'infrastructure/repos/firebase_repo_impl.dart' as _i38;
import 'infrastructure/repos/suggestion_repo_impl.dart' as _i65;
import 'infrastructure/repos/user_repo_impl.dart' as _i79;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i67;
import 'injection.dart' as _i91;

const String _development = 'development';
const String _production = 'production';
const String _staging = 'staging';
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
  gh.lazySingleton<_i6.Config>(() => _i7.DevelopmentConfig(),
      registerFor: {_development});
  gh.lazySingleton<_i6.Config>(() => _i8.ProductionConfig(),
      registerFor: {_production});
  gh.lazySingleton<_i6.Config>(() => _i9.StagingConfig(),
      registerFor: {_staging});
  gh.lazySingleton<_i10.DeleteFile>(
      () => _i10.DeleteFile(get<_i11.IFileRepo>()));
  gh.lazySingleton<_i12.EditBankDetailsBloc>(() => _i12.EditBankDetailsBloc());
  gh.lazySingleton<_i13.EditBasicInformationBloc>(
      () => _i13.EditBasicInformationBloc());
  gh.lazySingleton<_i14.EditBusinessDetailsBloc>(
      () => _i14.EditBusinessDetailsBloc());
  gh.lazySingleton<_i15.EditPasswordBloc>(() => _i15.EditPasswordBloc());
  gh.lazySingleton<_i16.FetchAllUsersBloc>(() => _i16.FetchAllUsersBloc());
  gh.lazySingleton<_i17.FetchAllYarnsBloc>(() => _i17.FetchAllYarnsBloc());
  gh.lazySingleton<_i18.FetchBrokerUsersBloc>(
      () => _i18.FetchBrokerUsersBloc());
  gh.lazySingleton<_i19.FetchCottonYarnsBloc>(
      () => _i19.FetchCottonYarnsBloc());
  gh.lazySingleton<_i20.FetchCpYarnsBloc>(() => _i20.FetchCpYarnsBloc());
  gh.lazySingleton<_i21.FetchFancyYarnsBloc>(() => _i21.FetchFancyYarnsBloc());
  gh.lazySingleton<_i22.FetchLinenYarnsBloc>(() => _i22.FetchLinenYarnsBloc());
  gh.lazySingleton<_i23.FetchMillUsersBloc>(() => _i23.FetchMillUsersBloc());
  gh.lazySingleton<_i24.FetchModalYarnsBloc>(() => _i24.FetchModalYarnsBloc());
  gh.lazySingleton<_i25.FetchPcYarnsBloc>(() => _i25.FetchPcYarnsBloc());
  gh.lazySingleton<_i26.FetchPsfYarnsBloc>(() => _i26.FetchPsfYarnsBloc());
  gh.lazySingleton<_i27.FetchPvYarnsBloc>(() => _i27.FetchPvYarnsBloc());
  gh.lazySingleton<_i28.FetchRayonYarnsBloc>(() => _i28.FetchRayonYarnsBloc());
  gh.lazySingleton<_i29.FetchSimilarYarnsBloc>(
      () => _i29.FetchSimilarYarnsBloc());
  gh.lazySingleton<_i30.FetchTexturizeYarnsBloc>(
      () => _i30.FetchTexturizeYarnsBloc());
  gh.lazySingleton<_i31.FetchTraderUsersBloc>(
      () => _i31.FetchTraderUsersBloc());
  gh.lazySingleton<_i32.FetchUserYarnsBloc>(() => _i32.FetchUserYarnsBloc());
  gh.lazySingleton<_i33.FetchViscoseYarnsBloc>(
      () => _i33.FetchViscoseYarnsBloc());
  gh.lazySingleton<_i34.FetchWorstedWoolYarnsBloc>(
      () => _i34.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i35.ForgotPasswordBloc>(() => _i35.ForgotPasswordBloc());
  gh.lazySingleton<_i36.GetFileDownloadLink>(
      () => _i36.GetFileDownloadLink(get<_i11.IFileRepo>()));
  gh.lazySingleton<_i37.IFirebaseRepo>(() => _i38.FireBaseRepo());
  gh.lazySingleton<_i39.ProfileBloc>(() => _i39.ProfileBloc());
  gh.lazySingleton<_i40.RequestFirebasePhoneAuthCode>(
      () => _i40.RequestFirebasePhoneAuthCode(get<_i37.IFirebaseRepo>()));
  gh.lazySingleton<_i41.ResetPasswordBloc>(() => _i41.ResetPasswordBloc());
  gh.lazySingleton<_i42.RestDataSource>(
      () => _i43.DioRestDataSource(get<_i6.Config>()));
  gh.lazySingleton<_i44.SelectOptionBloc>(() => _i44.SelectOptionBloc());
  await gh.factoryAsync<_i45.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i46.SignInBloc>(() => _i46.SignInBloc());
  gh.lazySingleton<_i47.SignUpBloc>(() => _i47.SignUpBloc());
  gh.lazySingleton<_i48.SplashBloc>(() => _i48.SplashBloc());
  gh.lazySingleton<_i49.SuggestionBloc>(() => _i49.SuggestionBloc());
  gh.lazySingleton<_i50.SuggestionCrudDatasource>(
      () => _i50.SuggestionLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i51.UploadFile>(
      () => _i51.UploadFile(get<_i11.IFileRepo>()));
  gh.lazySingleton<_i52.UserCrudDatasource>(
      () => _i52.UserLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i53.VerifyFirebasePhoneAuthCode>(
      () => _i53.VerifyFirebasePhoneAuthCode(get<_i37.IFirebaseRepo>()));
  gh.lazySingleton<_i54.YarnCrudDataSource>(
      () => _i54.YarnLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i55.BankDetailsCrudDatasource>(
      () => _i55.BankDetailsLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i56.BusinessDetailsCrudDatasource>(
      () => _i56.BusinessDetailsLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i57.CacheDataSource>(() =>
      _i58.SharedPreferencesCacheDataSource(get<_i45.SharedPreferences>()));
  gh.lazySingleton<_i59.FileCrudDatasource>(
      () => _i59.FileLoopbackDatasource(get<_i42.RestDataSource>()));
  gh.lazySingleton<_i60.IBankDetailsRepo>(
      () => _i61.BankDetailsRepoImpl(get<_i55.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i62.IBusinessDetailsRepo>(() =>
      _i63.BusinessDetailsRepoImpl(get<_i56.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i64.ISuggestionRepo>(
      () => _i65.SuggestionRepoImpl(get<_i50.SuggestionCrudDatasource>()));
  gh.lazySingleton<_i66.IYarnRepo>(
      () => _i67.YarnRepoImpl(get<_i54.YarnCrudDataSource>()));
  gh.factory<_i68.UpdateUserBankDetail>(
      () => _i68.UpdateUserBankDetail(get<_i60.IBankDetailsRepo>()));
  gh.lazySingleton<_i69.UpdateUserBusinessDetails>(
      () => _i69.UpdateUserBusinessDetails(get<_i62.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i70.UserCacheDataSource>(
      () => _i70.UserCacheDataSource(get<_i57.CacheDataSource>()));
  gh.lazySingleton<_i71.AddSuggestion>(
      () => _i71.AddSuggestion(get<_i64.ISuggestionRepo>()));
  gh.lazySingleton<_i72.AddYarnRequirement>(
      () => _i72.AddYarnRequirement(get<_i66.IYarnRepo>()));
  gh.lazySingleton<_i73.FetchSavedUserBankDetails>(
      () => _i73.FetchSavedUserBankDetails(get<_i60.IBankDetailsRepo>()));
  gh.lazySingleton<_i74.FetchSavedUserBusinessDetails>(() =>
      _i74.FetchSavedUserBusinessDetails(get<_i62.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i75.FetchUserYarns>(
      () => _i75.FetchUserYarns(get<_i66.IYarnRepo>()));
  gh.lazySingleton<_i76.FetchYarnByCategory>(
      () => _i76.FetchYarnByCategory(get<_i66.IYarnRepo>()));
  gh.lazySingleton<_i77.FetchYarnsOfUser>(
      () => _i77.FetchYarnsOfUser(get<_i66.IYarnRepo>()));
  gh.lazySingleton<_i78.IUserRepo>(() => _i79.UserRepoImpl(
      get<_i52.UserCrudDatasource>(), get<_i70.UserCacheDataSource>()));
  gh.lazySingleton<_i80.LoadLoggedInUser>(
      () => _i80.LoadLoggedInUser(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i81.SignInUser>(
      () => _i81.SignInUser(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i82.UpdateUserBasicInfo>(
      () => _i82.UpdateUserBasicInfo(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i83.AddNewUser>(
      () => _i83.AddNewUser(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i84.CacheLoggedInUser>(
      () => _i84.CacheLoggedInUser(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i85.CheckPhoneNumber>(
      () => _i85.CheckPhoneNumber(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i86.ClearLoggedInUser>(
      () => _i86.ClearLoggedInUser(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i87.FetchSavedUserBasicInformation>(
      () => _i87.FetchSavedUserBasicInformation(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i88.FetchUserBasicInformationByPhoneNumber>(
      () => _i88.FetchUserBasicInformationByPhoneNumber(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i89.FetchUsersById>(
      () => _i89.FetchUsersById(get<_i78.IUserRepo>()));
  gh.lazySingleton<_i90.FetchUsersByType>(
      () => _i90.FetchUsersByType(get<_i78.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i91.RegisterModule {}
