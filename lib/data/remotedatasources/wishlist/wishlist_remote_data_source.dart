
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/wishlist/add_to_wishlist_response_dto.dart';
import 'package:e_commerce_app/data/models/wishlist/get_products_wishlist_dto.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failures,AddToWishlistResponseDto>> addProductToWishList(String productID) ;
  Future<Either<Failures,GetWishlistResponseDto>> getProductsWishlist();
  Future<Either<Failures,AddToWishlistResponseDto>> removeProductFromWishlist(String productID) ;
 }