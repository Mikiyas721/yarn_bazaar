// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i27;

import 'application/add_yarn_requirement/add_yarn_requirement_bloc.dart' as _i3;
import 'application/edit_bank_details/edit_bank_details_bloc.dart' as _i4;
import 'application/edit_basic_information/edit_basic_information_bloc.dart'
    as _i5;
import 'application/edit_business_details/edit_business_details_bloc.dart'
    as _i6;
import 'application/edit_password/edit_password_bloc.dart' as _i7;
import 'application/fetch_users_all/fetch_all_users_bloc.dart' as _i8;
import 'application/fetch_users_broker/fetch_broker_users_bloc.dart' as _i10;
import 'application/fetch_users_mill/fetch_mill_users_bloc.dart' as _i15;
import 'application/fetch_users_trader/fetch_trader_users_bloc.dart' as _i22;
import 'application/fetch_yarns_all/fetch_all_yarns_bloc.dart' as _i9;
import 'application/fetch_yarns_cotton/fetch_cotton_yarns_bloc.dart' as _i11;
import 'application/fetch_yarns_cp/fetch_cp_yarns_bloc.dart' as _i12;
import 'application/fetch_yarns_fancy/fetch_fancy_yarns_bloc.dart' as _i13;
import 'application/fetch_yarns_linen/fetch_linen_yarns_bloc.dart' as _i14;
import 'application/fetch_yarns_modal/fetch_modal_yarns_bloc.dart' as _i16;
import 'application/fetch_yarns_pc/fetch_pc_yarns_bloc.dart' as _i17;
import 'application/fetch_yarns_psf/fetch_psf_yarns_bloc.dart' as _i18;
import 'application/fetch_yarns_pv/fetch_pv_yarns_bloc.dart' as _i19;
import 'application/fetch_yarns_rayon/fetch_rayon_yarns_bloc.dart' as _i20;
import 'application/fetch_yarns_texturize/fetch_texturize_yarns_bloc.dart'
    as _i21;
import 'application/fetch_yarns_viscose/fetch_viscose_yarns_bloc.dart' as _i23;
import 'application/fetch_yarns_worsted_wool/fetch_worsted_wool_yarns_bloc.dart'
    as _i24;
import 'application/sign_in/sign_in_bloc.dart' as _i28;
import 'application/sign_up/sign_up_bloc.dart' as _i29;
import 'domain/ports/bank_details_repo.dart' as _i36;
import 'domain/ports/business_details_repo.dart' as _i38;
import 'domain/ports/user_repo.dart' as _i48;
import 'domain/ports/yarn_repo.dart' as _i40;
import 'domain/use_cases/add_new_user.dart' as _i53;
import 'domain/use_cases/add_yarn_requirement.dart' as _i45;
import 'domain/use_cases/clear_loggedin_user.dart' as _i54;
import 'domain/use_cases/fetch_user_by_id.dart' as _i55;
import 'domain/use_cases/fetch_users_by_type.dart' as _i56;
import 'domain/use_cases/fetch_yarn_by_category.dart' as _i46;
import 'domain/use_cases/fetch_yarns_of_user.dart' as _i47;
import 'domain/use_cases/load_logged_in_user.dart' as _i50;
import 'domain/use_cases/save_user.dart' as _i51;
import 'domain/use_cases/update_user_bank_details.dart' as _i42;
import 'domain/use_cases/update_user_basic_info.dart' as _i52;
import 'domain/use_cases/update_user_business_details.dart' as _i43;
import 'infrastructure/datasources/bank_details_datasource.dart' as _i32;
import 'infrastructure/datasources/business_details_datasource.dart' as _i33;
import 'infrastructure/datasources/shared/cache_datasource/cache_datasource.dart'
    as _i34;
import 'infrastructure/datasources/shared/cache_datasource/shared_preferences_cache_datasource.dart'
    as _i35;
import 'infrastructure/datasources/shared/dio_rest_datasource.dart' as _i26;
import 'infrastructure/datasources/shared/rest_datasource/rest_datasource.dart'
    as _i25;
import 'infrastructure/datasources/user_cache_datasource.dart' as _i44;
import 'infrastructure/datasources/user_datasource.dart' as _i30;
import 'infrastructure/datasources/yarn_datasource.dart' as _i31;
import 'infrastructure/repos/bank_details_repo_impl.dart' as _i37;
import 'infrastructure/repos/business_details_repo_impl.dart' as _i39;
import 'infrastructure/repos/user_repo_impl.dart' as _i49;
import 'infrastructure/repos/yarn_repo_impl.dart' as _i41;
import 'injection.dart' as _i57; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AddYarnRequirementBloc>(() => _i3.AddYarnRequirementBloc());
  gh.factory<_i4.EditBankDetailsBloc>(() => _i4.EditBankDetailsBloc());
  gh.factory<_i5.EditBasicInformationBloc>(
      () => _i5.EditBasicInformationBloc());
  gh.factory<_i6.EditBusinessDetailsBloc>(() => _i6.EditBusinessDetailsBloc());
  gh.factory<_i7.EditPasswordBloc>(() => _i7.EditPasswordBloc());
  gh.factory<_i8.FetchAllUsersBloc>(() => _i8.FetchAllUsersBloc());
  gh.factory<_i9.FetchAllYarnsBloc>(() => _i9.FetchAllYarnsBloc());
  gh.factory<_i10.FetchBrokerUsersBloc>(() => _i10.FetchBrokerUsersBloc());
  gh.factory<_i11.FetchCottonYarnsBloc>(() => _i11.FetchCottonYarnsBloc());
  gh.factory<_i12.FetchCpYarnsBloc>(() => _i12.FetchCpYarnsBloc());
  gh.factory<_i13.FetchFancyYarnsBloc>(() => _i13.FetchFancyYarnsBloc());
  gh.factory<_i14.FetchLinenYarnsBloc>(() => _i14.FetchLinenYarnsBloc());
  gh.factory<_i15.FetchMillUsersBloc>(() => _i15.FetchMillUsersBloc());
  gh.factory<_i16.FetchModalYarnsBloc>(() => _i16.FetchModalYarnsBloc());
  gh.factory<_i17.FetchPcYarnsBloc>(() => _i17.FetchPcYarnsBloc());
  gh.factory<_i18.FetchPsfYarnsBloc>(() => _i18.FetchPsfYarnsBloc());
  gh.factory<_i19.FetchPvYarnsBloc>(() => _i19.FetchPvYarnsBloc());
  gh.factory<_i20.FetchRayonYarnsBloc>(() => _i20.FetchRayonYarnsBloc());
  gh.factory<_i21.FetchTexturizeYarnsBloc>(
      () => _i21.FetchTexturizeYarnsBloc());
  gh.factory<_i22.FetchTraderUsersBloc>(() => _i22.FetchTraderUsersBloc());
  gh.factory<_i23.FetchViscoseYarnsBloc>(() => _i23.FetchViscoseYarnsBloc());
  gh.factory<_i24.FetchWorstedWoolYarnsBloc>(
      () => _i24.FetchWorstedWoolYarnsBloc());
  gh.lazySingleton<_i25.RestDataSource>(() => _i26.DioRestDataSource());
  await gh.factoryAsync<_i27.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i28.SignInBloc>(() => _i28.SignInBloc());
  gh.factory<_i29.SignUpBloc>(() => _i29.SignUpBloc());
  gh.lazySingleton<_i30.UserCrudDatasource>(
      () => _i30.UserLoopbackDatasource(get<_i25.RestDataSource>()));
  gh.lazySingleton<_i31.YarnCrudDataSource>(
      () => _i31.YarnLoopbackDatasource(get<_i25.RestDataSource>()));
  gh.lazySingleton<_i32.BankDetailsCrudDatasource>(
      () => _i32.BankDetailsLoopbackDatasource(get<_i25.RestDataSource>()));
  gh.lazySingleton<_i33.BusinessDetailsCrudDatasource>(
      () => _i33.BusinessDetailsLoopbackDatasource(get<_i25.RestDataSource>()));
  gh.lazySingleton<_i34.CacheDataSource>(() =>
      _i35.SharedPreferencesCacheDataSource(get<_i27.SharedPreferences>()));
  gh.lazySingleton<_i36.IBankDetailsRepo>(
      () => _i37.BankDetailsRepoImpl(get<_i32.BankDetailsCrudDatasource>()));
  gh.lazySingleton<_i38.IBusinessDetailsRepo>(() =>
      _i39.BusinessDetailsRepoImpl(get<_i33.BusinessDetailsCrudDatasource>()));
  gh.lazySingleton<_i40.IYarnRepo>(
      () => _i41.YarnRepoImpl(get<_i31.YarnCrudDataSource>()));
  gh.factory<_i42.UpdateUserBankDetails>(
      () => _i42.UpdateUserBankDetails(get<_i36.IBankDetailsRepo>()));
  gh.factory<_i43.UpdateUserBusinessDetails>(
      () => _i43.UpdateUserBusinessDetails(get<_i38.IBusinessDetailsRepo>()));
  gh.lazySingleton<_i44.UserCacheDataSource>(
      () => _i44.UserCacheDataSource(get<_i34.CacheDataSource>()));
  gh.lazySingleton<_i45.AddYarnRequirement>(
      () => _i45.AddYarnRequirement(get<_i40.IYarnRepo>()));
  gh.lazySingleton<_i46.FetchYarnByCategory>(
      () => _i46.FetchYarnByCategory(get<_i40.IYarnRepo>()));
  gh.lazySingleton<_i47.FetchYarnsOfUser>(
      () => _i47.FetchYarnsOfUser(get<_i40.IYarnRepo>()));
  gh.lazySingleton<_i48.IUserRepo>(() => _i49.UserRepoImpl(
      get<_i30.UserCrudDatasource>(), get<_i44.UserCacheDataSource>()));
  gh.lazySingleton<_i50.LoadLoggedInUser>(
      () => _i50.LoadLoggedInUser(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i51.SaveUser>(() => _i51.SaveUser(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i52.UpdateUserBasicInfo>(
      () => _i52.UpdateUserBasicInfo(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i53.AddNewUser>(
      () => _i53.AddNewUser(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i54.ClearLoggedInUser>(
      () => _i54.ClearLoggedInUser(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i55.FetchUsersById>(
      () => _i55.FetchUsersById(get<_i48.IUserRepo>()));
  gh.lazySingleton<_i56.FetchUsersByType>(
      () => _i56.FetchUsersByType(get<_i48.IUserRepo>()));
  return get;
}

class _$RegisterModule extends _i57.RegisterModule {}
