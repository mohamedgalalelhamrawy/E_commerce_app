 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures,GetAllGategoriesOrBrandsEntity>> getAllCategories();
  Future<Either<Failures,GetAllGategoriesOrBrandsEntity>> getAllBrands();
}
