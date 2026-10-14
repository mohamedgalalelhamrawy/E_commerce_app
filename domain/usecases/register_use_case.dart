import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:flutter/material.dart';
import '../entities/register_respose_enttity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);
  Future<Either<Failures, RegisterResponseEntity>> invoke(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    return authRepository.register(
        name: name, email: email, password: password, phone: phone);
  }
}
