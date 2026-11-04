 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';
import 'package:e_commerce_app/domain/repository/wishlist_repository.dart';

class RemoveProdFromWishlistUseCase {
  WishlistRepository wishlistRepository;
  RemoveProdFromWishlistUseCase({required this.wishlistRepository});
  Future<Either<Failures,AddToWishlistResponseEntity>> invoke(String productID){
    return wishlistRepository.removeProducrtFromWishlist(productID);
  }
 }