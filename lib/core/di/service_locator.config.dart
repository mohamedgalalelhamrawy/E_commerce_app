// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/remotedatasources/auth_remote_data_source.dart' as _i563;
import '../../data/remotedatasources/auth_remote_data_source_impl.dart'
    as _i325;
import '../../data/repository/Auth_repository_impl.dart' as _i1007;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../domain/usecases/register_use_case.dart' as _i502;
import '../../features/auth/cubit/cubit/auth_cubit.dart' as _i490;
import '../api/apimanager.dart' as _i808;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i808.ApiManager>(() => _i808.ApiManager());
  gh.factory<_i563.AuthRemoteDataSource>(
      () => _i325.AuthRemoteDataSourceImpl(gh<_i808.ApiManager>()));
  gh.factory<_i614.AuthRepository>(
      () => _i1007.AuthRepositoryImpl(gh<_i563.AuthRemoteDataSource>()));
  gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(gh<_i614.AuthRepository>()));
  gh.factory<_i502.RegisterUseCase>(
      () => _i502.RegisterUseCase(gh<_i614.AuthRepository>()));
  gh.factory<_i490.RegisterCubit>(() => _i490.RegisterCubit(
        gh<_i502.RegisterUseCase>(),
        gh<_i210.LoginUseCase>(),
      ));
  return getIt;
}
