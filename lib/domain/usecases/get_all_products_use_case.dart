 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/domain/repository/products_repostory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  ProductsRepostory productsRepostory;
  GetAllProductsUseCase({required this.productsRepostory});
  Future<Either<Failures,GetAllProductsResponseEntity>> invoke(){
    return  productsRepostory.getAllProducts();
  }
 }