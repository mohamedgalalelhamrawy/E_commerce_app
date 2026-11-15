import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';
import 'package:e_commerce_app/domain/entities/wishlist/get_products_wishlist_entity.dart';
import 'package:e_commerce_app/domain/usecases/wishlist/add_product_to_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/usecases/wishlist/get_products_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/usecases/wishlist/remove_prod_from_wishlist_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

@injectable
class WishListCubit extends Cubit<WishListState> {
  WishListCubit(
      {required this.addProductToWishlistUseCase,
      required this.getProductsWishlistUseCase,
      required this.removeProdFromWishlistUseCase})
      : super(WishListInitial());
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  GetProductsWishlistUseCase getProductsWishlistUseCase;
  RemoveProdFromWishlistUseCase removeProdFromWishlistUseCase;
  List<String> WishListprductIDs = [];
  bool isFavorite(String productID) {
    return WishListprductIDs.contains(productID);
  }
  List<ProductResponseEntity> wishlistProducts = [];
  ///////////// add prod
  void addProductToWishlist(String productID,ProductResponseEntity product) async {
    emit(AddProductToWishLishLoadingState());
    var either = await addProductToWishlistUseCase.invoke(productID);
    return either.fold(
        (failure) => emit(AddProductToWishLishErrorState(failures: failure)),
        (addprod) {
      WishListprductIDs.add(productID);
      wishlistProducts.add(product);
      emit(AddProductToWishLishSucessState(
          addToWishlistResponseEntity: addprod));
    });
  }

  ///// object
  static WishListCubit get(context) => BlocProvider.of<WishListCubit>(context);
  ////////// get Prods
  void getProductsOfWishList() async {
    emit(getProductsOfWishListLoadingState());
    var either = await getProductsWishlistUseCase.invoke();
    return either.fold((failure) {
      emit(getProductsOfWishListErrorState(failures: failure));
    }, (getProds) {
      WishListprductIDs = getProds.data!.map((e) => e.id ?? '').toList();
      wishlistProducts = getProds.data ??[];
      emit(getProductsOfWishListSuccessState(
          getWishlistResponseEntity: getProds));
    });
  }
  /////// remove prod
  void removeProdFromWishList(String productID) async {
    emit(RemoveProductFromWishListLoadingState());
    var either = await removeProdFromWishlistUseCase.invoke(productID);
    return either.fold(
        (failure) =>
            emit(RemoveProductFromWishListErrorState(failures: failure)),
        (removeProd) {
          WishListprductIDs.remove(productID);
          wishlistProducts.removeWhere((item) => item.id.toString() == productID);
          emit(RemoveProductFromWishListSuccessState(addToWishlistResponseEntity: removeProd));} );
  }
}
