part of 'cart_cubit.dart';

@immutable
sealed class CartState {}
final class CartInitial extends CartState {}
class AddProductToCartLoadingState extends CartState{}
class AddProductToCartErrorState extends CartState{
 final Failures failures;
  AddProductToCartErrorState({required this.failures});
}
class AddProductToCartSuccessState extends CartState{
 final AddProductToCartResponseEntity addProductToCartResponseEntity;
  AddProductToCartSuccessState({required this.addProductToCartResponseEntity});
} 
////////////////////////// get products
class GetProductsOfCartLoadingState extends CartState{}
class GetProductsOfCartErrorState extends CartState{
 final Failures failures;
  GetProductsOfCartErrorState({required this.failures});
}
class GetProductsOfCartSuccessState extends CartState{
 final GetCartResponseEntity getCartResponseEntity;
  GetProductsOfCartSuccessState({required this.getCartResponseEntity});
}
//////////////////////////