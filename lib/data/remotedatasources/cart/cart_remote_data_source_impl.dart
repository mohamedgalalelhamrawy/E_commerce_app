import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/core/sharedprefrence/sharedprefrence.dart';
import 'package:e_commerce_app/data/models/cart/add_to_cart_response_dto.dart';
import 'package:e_commerce_app/data/models/cart/get_cart_response_dto.dart';
import 'package:e_commerce_app/data/remotedatasources/cart/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, AddProductToCartResponseDto>> addProductToCart(
      String productID) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.getdata(key: "token");
        var response = await apiManager.postData(
            endPoints: EndPoints.addProductToCart,
            body: {"productId": productID},
            headers: {"token": token.toString()});
        var model = AddProductToCartResponseDto.fromJson(response.data);
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

  @override
  Future<Either<Failures, GetCartResponseDto>> getProductsCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
            var token = SharedPreferencesUtils.getdata(key: "token");
        var response = await apiManager.getData(
            endPoints: EndPoints.addProductToCart,headers: {"token": token.toString()}
        );
        var model = GetCartResponseDto.fromJson(response.data);
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
