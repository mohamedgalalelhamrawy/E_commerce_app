
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';

import '../models/register_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures,RegisterResposeDto>> register(
      {required String name,
      required String email,
      required String password,
      required String phone});
 Future<Either<Failures,RegisterResposeDto>> logIn({
    required String email,
    required String password,
  });     
}
