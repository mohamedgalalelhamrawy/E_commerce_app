 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';

abstract class ProductsRepostory {
  Future<Either<Failures,GetAllProductsResponseEntity>> getAllProducts();
 }