 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/cart/add_to_cart_response_entity.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddProductToCartUseCase {
  CartRepository cartRepository;
  AddProductToCartUseCase({required this.cartRepository});

  Future<Either<Failures,AddProductToCartResponseEntity>> invoke(String productID){
    return cartRepository.addProductToCart(productID);
  }
 }