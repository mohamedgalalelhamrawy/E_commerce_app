import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/register_response_dto.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Either<Failures,RegisterResposeDto>> register(
      {required String name,
      required String email,
      required String password,
      required String phone,
      }) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) || checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(endPoints: EndPoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone,
        },); 
        print("RESPONSE DATA IS: ${response.data}");
        var model = RegisterResposeDto.fromJson(response.data) ;
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
