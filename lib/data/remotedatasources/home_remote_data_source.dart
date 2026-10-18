import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/get_all_gategories_dto.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures,GetAllGategoriesOrBrandsResponseDto>> getAllCatergories();
  Future<Either<Failures,GetAllGategoriesOrBrandsResponseDto>> getAllBrands();
}
