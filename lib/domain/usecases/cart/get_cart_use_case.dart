import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/cart/get_cart_response_entity.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getProductsCart();
  }
}
