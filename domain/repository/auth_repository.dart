import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import '../entities/register_respose_enttity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
      {required String name,
      required String email,
      required String password,
      required String phone});
}
