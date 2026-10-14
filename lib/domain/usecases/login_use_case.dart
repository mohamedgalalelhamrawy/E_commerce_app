import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<Either<Failures, RegisterResponseEntity>> invoke({
    required String email,
    required String password,
  }) {
    return authRepository.logIn(email: email, password: password);
  }
}
