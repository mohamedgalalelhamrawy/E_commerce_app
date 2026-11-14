part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

class AddProductToWishLishLoadingState extends WishListState {}

class AddProductToWishLishErrorState extends WishListState {
  final Failures failures;
  AddProductToWishLishErrorState({required this.failures});
}

class AddProductToWishLishSucessState extends WishListState {
  final AddToWishlistResponseEntity addToWishlistResponseEntity;
  AddProductToWishLishSucessState({required this.addToWishlistResponseEntity});
}

////// get WishList
class getProductsOfWishListLoadingState extends WishListState {}

class getProductsOfWishListErrorState extends WishListState {
  final Failures failures;
  getProductsOfWishListErrorState({required this.failures});
}

class getProductsOfWishListSuccessState extends WishListState {
  GetWishlistResponseEntity getWishlistResponseEntity;
  getProductsOfWishListSuccessState({required this.getWishlistResponseEntity});
}
