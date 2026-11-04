 
 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/core/sharedprefrence/sharedprefrence.dart';
import 'package:e_commerce_app/data/models/wishlist/add_to_wishlist_response_dto.dart';
import 'package:e_commerce_app/data/models/wishlist/get_products_wishlist_dto.dart';
import 'package:e_commerce_app/data/remotedatasources/wishlist/wishlist_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource{
  ApiManager apiManager;
  WishlistRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, AddToWishlistResponseDto>> addProductToWishList(String productID) async{
     try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.getdata(key: "token");
        var response = await apiManager.postData(
            endPoints: EndPoints.addProductToWishList,
            body: {"productId": productID},
            headers: {"token": token.toString()});
        var model = AddToWishlistResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(model);
        } else {
          return Left(ServerFailure(model.message ?? "An error occurred"));
        }
      } else {
        return Left(NetworkFailure("No Internet"));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  ////////////////////// (get Prodcts wishlist)
  @override
  Future<Either<Failures, GetWishlistResponseDto>> getProductsWishlist() async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.getdata(key: "token");
        var response = await apiManager.getData(
            endPoints: EndPoints.addProductToWishList,
            headers: {"token": token.toString()});
        var model = GetWishlistResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(model);
        } else {
          return Left(ServerFailure(model.message ?? "An error occurred"));
        }
      } else {
        return Left(NetworkFailure("No Internet"));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
////////////////////// (remove product from wishlist)
  @override
  Future<Either<Failures, AddToWishlistResponseDto>> removeProductFromWishlist(String productID) async {
   try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.getdata(key: "token");
        var response = await apiManager.deleteData(
            endPoints: "${EndPoints.addProductToWishList}/$productID",
            headers: {"token": token.toString()});
        var model = AddToWishlistResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(model);
        } else {
          return Left(ServerFailure(model.message ?? "An error occurred"));
        }
      } else {
        return Left(NetworkFailure("No Internet"));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

 }