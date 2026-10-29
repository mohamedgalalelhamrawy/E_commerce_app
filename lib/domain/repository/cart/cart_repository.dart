
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/cart/add_to_cart_response_entity.dart';
import 'package:e_commerce_app/domain/entities/cart/get_cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failures,AddProductToCartResponseEntity>> addProductToCart(String productID) ;
  Future<Either<Failures,GetCartResponseEntity>> getProductsCart();
}