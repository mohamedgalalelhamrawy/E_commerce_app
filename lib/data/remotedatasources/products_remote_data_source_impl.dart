 
 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/get_all_products_dto.dart';
import 'package:e_commerce_app/data/remotedatasources/products_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl  implements ProductsRemoteDataSource{
  ApiManager apiManager;
 ProductsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetAllProductsResponseDto>> getAllProducts() async{
     try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) || checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoints: EndPoints.getAllProducts); 
        var model = GetAllProductsResponseDto.fromJson(response.data) ;
       if(response.statusCode! >= 200 && response.statusCode! < 300){
               return Right(model);
       }else{
           return Left(ServerFailure(model.message ?? "An error occurred"));
       }
      }else{
          return Left(NetworkFailure("No Internet"));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
 }