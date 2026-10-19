 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/get_all_products_dto.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Failures,GetAllProductsResponseDto>> getAllProducts();
 }