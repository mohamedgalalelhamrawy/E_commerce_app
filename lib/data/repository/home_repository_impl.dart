 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/remotedatasources/home_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, GetAllGategoriesOrBrandsEntity>> getAllCategories() async {
     var either = await homeRemoteDataSource.getAllCatergories();
     return either.fold(
      (failure) => Left(failure)
      , (category)=> Right(category.toEntity()));
  }

  @override
  Future<Either<Failures, GetAllGategoriesOrBrandsEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
     return either.fold(
      (failure) => Left(failure)
      , (categoryOrBrand)=> Right(categoryOrBrand.toEntity()));
  }

  
  
}