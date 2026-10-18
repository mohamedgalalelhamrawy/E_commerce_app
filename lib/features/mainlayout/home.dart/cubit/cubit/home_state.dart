part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetAllCategoriesLoadingState extends HomeState {}

class GetAllCategoriesErrorState extends HomeState {
 final  Failures failures;
  GetAllCategoriesErrorState({required this.failures});
}

class GetAllCategoriesSuccessState extends HomeState {
 final GetAllGategoriesOrBrandsEntity getAllGategoriesEntity;
  GetAllCategoriesSuccessState({required this.getAllGategoriesEntity});
}

class GetAllBrandsLoadingState extends HomeState {}

class GetAllBrandsErrorState extends HomeState {
 final  Failures failures;
  GetAllBrandsErrorState({required this.failures});
}

class GetAllBrandsSuccessState extends HomeState {
 final GetAllGategoriesOrBrandsEntity getAllbrandsEntity;
  GetAllBrandsSuccessState({required this.getAllbrandsEntity});
}