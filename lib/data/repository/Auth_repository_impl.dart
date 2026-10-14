import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/register_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../remotedatasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    var eitherResult = await authRemoteDataSource.register( name: name, email: email, password: password, phone: phone);
   return   eitherResult.fold((error) => Left(error),
        (registerResponseDto) => Right(registerResponseDto.toEntity()));
  }
}
