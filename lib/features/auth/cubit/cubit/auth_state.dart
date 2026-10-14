part of 'auth_cubit.dart';


@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState{}

class RegisterErrorState extends RegisterState{
 final  Failures failures;
  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterState{
 final RegisterResponseEntity registerResponseEntity;
 RegisterSuccessState({required this.registerResponseEntity});
 
}


class LogInLoadingState extends RegisterState{}

class LogInErrorState extends RegisterState{
 final  Failures failures;
  LogInErrorState({required this.failures});
}

class LogInSuccessState extends RegisterState{
 final RegisterResponseEntity registerResponseEntity;
 LogInSuccessState({required this.registerResponseEntity});
}




