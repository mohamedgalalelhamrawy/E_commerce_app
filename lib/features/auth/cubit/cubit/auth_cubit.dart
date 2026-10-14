import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/usecases/login_use_case.dart';
import 'package:e_commerce_app/domain/usecases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';

part 'auth_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  RegisterCubit(this.registerUseCase, this.loginUseCase)
      : super(RegisterInitial());
  var formkey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();

  void register() async {
    emit(RegisterLoadingState());

    var eitherResult = await registerUseCase.invoke(
        name: namecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        phone: phonecontroller.text);

    eitherResult.fold((failure) {
      print("=== ERROR IS: ${failure.errmessage} ===");
      emit(RegisterErrorState(failures: failure));
    }, (response) {
      print("=== SUCCESS ===");
      emit(RegisterSuccessState(registerResponseEntity: response));
    });
  }

  void logIn() async {
    emit(LogInLoadingState());

    var eitherResult = await loginUseCase.invoke(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );

    eitherResult.fold((failure) {
      print("=== ERROR IS: ${failure.errmessage} ===");
      emit(LogInErrorState(failures: failure));
    }, (response) {
      print("=== SUCCESS ===");
      emit(LogInSuccessState(registerResponseEntity: response));
    });
  }
}
