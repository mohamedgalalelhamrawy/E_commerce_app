part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsErrorState extends ProductsState {
  final Failures failures;
  ProductsErrorState({required this.failures});
}

class ProductsSccessState extends ProductsState {
  final GetAllProductsResponseEntity getAllProductsResponseEntity;
  ProductsSccessState({required this.getAllProductsResponseEntity});
}
