part of 'register_cubit.dart';


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




