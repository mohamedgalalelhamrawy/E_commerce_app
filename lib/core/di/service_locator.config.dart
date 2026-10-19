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
import '../../data/remotedatasources/home_remote_data_source.dart' as _i584;
import '../../data/remotedatasources/home_remote_data_source_impl.dart'
    as _i579;
import '../../data/remotedatasources/products_remote_data_source.dart' as _i682;
import '../../data/remotedatasources/products_remote_data_source_impl.dart'
    as _i1022;
import '../../data/repository/Auth_repository_impl.dart' as _i1007;
import '../../data/repository/home_repository_impl.dart' as _i1043;
import '../../data/repository/products_repository_imp.dart' as _i785;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/repository/home_repository.dart' as _i181;
import '../../domain/repository/products_repostory.dart' as _i547;
import '../../domain/usecases/get_all_brands_use_case.dart' as _i318;
import '../../domain/usecases/get_all_categories_use_case.dart' as _i716;
import '../../domain/usecases/get_all_products_use_case.dart' as _i436;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../domain/usecases/register_use_case.dart' as _i502;
import '../../features/auth/cubit/cubit/auth_cubit.dart' as _i490;
import '../../features/mainlayout/home.dart/cubit/cubit/home_cubit.dart'
    as _i520;
import '../../features/mainlayout/proudcts/cubit/cubit/products_cubit.dart'
    as _i1005;
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
  gh.factory<_i584.HomeRemoteDataSource>(
      () => _i579.HomeRemoteDataSourceImpl(apiManager: gh<_i808.ApiManager>()));
  gh.factory<_i682.ProductsRemoteDataSource>(() =>
      _i1022.ProductsRemoteDataSourceImpl(apiManager: gh<_i808.ApiManager>()));
  gh.factory<_i181.HomeRepository>(() => _i1043.HomeRepositoryImpl(
      homeRemoteDataSource: gh<_i584.HomeRemoteDataSource>()));
  gh.factory<_i563.AuthRemoteDataSource>(
      () => _i325.AuthRemoteDataSourceImpl(gh<_i808.ApiManager>()));
  gh.factory<_i318.GetAllbrandsUseCase>(() =>
      _i318.GetAllbrandsUseCase(homeRepository: gh<_i181.HomeRepository>()));
  gh.factory<_i716.GetAllCategoriesUseCase>(() => _i716.GetAllCategoriesUseCase(
      homeRepository: gh<_i181.HomeRepository>()));
  gh.factory<_i614.AuthRepository>(
      () => _i1007.AuthRepositoryImpl(gh<_i563.AuthRemoteDataSource>()));
  gh.factory<_i547.ProductsRepostory>(() => _i785.ProductsRepositoryImp(
      productsRemoteDataSource: gh<_i682.ProductsRemoteDataSource>()));
  gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(gh<_i614.AuthRepository>()));
  gh.factory<_i502.RegisterUseCase>(
      () => _i502.RegisterUseCase(gh<_i614.AuthRepository>()));
  gh.factory<_i436.GetAllProductsUseCase>(() => _i436.GetAllProductsUseCase(
      productsRepostory: gh<_i547.ProductsRepostory>()));
  gh.factory<_i1005.ProductsCubit>(() => _i1005.ProductsCubit(
      getAllProductsUseCase: gh<_i436.GetAllProductsUseCase>()));
  gh.factory<_i520.HomeCubit>(() => _i520.HomeCubit(
        getAllCategoriesUseCase: gh<_i716.GetAllCategoriesUseCase>(),
        getAllbrandsUseCase: gh<_i318.GetAllbrandsUseCase>(),
      ));
  gh.factory<_i490.RegisterCubit>(() => _i490.RegisterCubit(
        gh<_i502.RegisterUseCase>(),
        gh<_i210.LoginUseCase>(),
      ));
  return getIt;
}
