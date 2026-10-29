 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/cart/add_to_cart_response_dto.dart';
import 'package:e_commerce_app/data/models/cart/get_cart_response_dto.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures,AddProductToCartResponseDto>> addProductToCart(String productID);
  Future<Either<Failures,GetCartResponseDto>> getProductsCart();
 }