 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/wishlist/get_products_wishlist_entity.dart';
import 'package:e_commerce_app/domain/repository/wishlist_repository.dart';

class GetProductsWishlistUseCase {
  WishlistRepository wishlistRepository;
  GetProductsWishlistUseCase({required this.wishlistRepository});
  Future<Either<Failures,GetWishlistResponseEntity>> invoke() {
    return wishlistRepository.getProductsWishlist();
  }
 }