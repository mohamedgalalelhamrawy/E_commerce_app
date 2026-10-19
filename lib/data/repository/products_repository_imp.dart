 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/remotedatasources/products_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/domain/repository/products_repostory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepostory)
class ProductsRepositoryImp implements ProductsRepostory{
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImp({required this.productsRemoteDataSource});
  @override
  Future<Either<Failures, GetAllProductsResponseEntity>> getAllProducts() async {
   var either = await productsRemoteDataSource.getAllProducts();
   return either.fold((error)=> Left(error), (product) =>Right(product.toEntity()));
  }
}