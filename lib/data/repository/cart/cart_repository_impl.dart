 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/remotedatasources/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/cart/add_to_cart_response_entity.dart';
import 'package:e_commerce_app/domain/entities/cart/get_cart_response_entity.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, AddProductToCartResponseEntity>> addProductToCart(String productID) async {
    var either = await cartRemoteDataSource.addProductToCart(productID);
    return either.fold((failure) => Left(failure), (addproduct) => Right(addproduct.toEntity()));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> getProductsCart() async{
  var either = await cartRemoteDataSource.getProductsCart();
  return either.fold((failure)=>Left(failure),(getcart)=>Right(getcart.toEntity()));
  }
  
}