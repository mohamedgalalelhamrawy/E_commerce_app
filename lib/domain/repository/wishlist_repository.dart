 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';
import 'package:e_commerce_app/domain/entities/wishlist/get_products_wishlist_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failures,AddToWishlistResponseEntity>> addProductToWishList(String productID) ;
  Future<Either<Failures,GetWishlistResponseEntity>> getProductsWishlist();
  Future<Either<Failures,AddToWishlistResponseEntity>> removeProducrtFromWishlist(String productID) ;
 }