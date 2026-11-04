 
 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/remotedatasources/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';
import 'package:e_commerce_app/domain/entities/wishlist/get_products_wishlist_entity.dart';
import 'package:e_commerce_app/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
 
 @Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository{
  WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});
  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> addProductToWishList(String productID) async {
    var either = await wishlistRemoteDataSource.addProductToWishList(productID);
    return either.fold((failure)=>Left(failure) , (addprod)=>Right(addprod.toEntity()));
  }

  @override
  Future<Either<Failures, GetWishlistResponseEntity>> getProductsWishlist() async {
   var either = await wishlistRemoteDataSource.getProductsWishlist();
    return either.fold((failure)=>Left(failure) , (getprods)=>Right(getprods.toEntity()));
  }

  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> removeProducrtFromWishlist(String productID) async {
     var either = await wishlistRemoteDataSource.removeProductFromWishlist(productID);
    return either.fold((failure)=>Left(failure) , (removeprod)=>Right(removeprod.toEntity()));
  }
  
}