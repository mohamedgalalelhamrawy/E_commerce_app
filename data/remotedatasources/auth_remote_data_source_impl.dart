import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/apimanager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/register_response_dto.dart';
import 'auth_remote_data_source.dart';

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
      bool result = await InternetConnectionChecker.instance.hasConnection;
      if (result) {
        var response = await apiManager.postData(endPoints: EndPoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone
        }); 
        var model = RegisterResposeDto.fromJson(response.data) ;
       if(response.statusCode! >= 200 && response.statusCode! < 300){
               return Right(model);
       }else{
           return Left(ServerFailure(model.message));
       }
      }else{
          return Left(ServerFailure("NO INTERNET"));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
