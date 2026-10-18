 
 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/data/models/get_all_gategories_dto.dart';
import 'package:e_commerce_app/data/remotedatasources/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetAllGategoriesOrBrandsResponseDto>> getAllCatergories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) || checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoints: EndPoints.getAllCategories); 
        var model = GetAllGategoriesOrBrandsResponseDto.fromJson(response.data) ;
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

  @override
  Future<Either<Failures, GetAllGategoriesOrBrandsResponseDto>> getAllBrands() async {
   try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) || checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoints: EndPoints.getAllBrands); 
        var model = GetAllGategoriesOrBrandsResponseDto.fromJson(response.data) ;
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