import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';
import 'package:e_commerce_app/domain/usecases/wishlist/add_product_to_wishlist_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';
@injectable
class WishListCubit extends Cubit<WishListState> {
  WishListCubit({required this.addProductToWishlistUseCase})
      : super(WishListInitial());
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  List<String> WishListprductIDs=[];
  bool isFavorite(String productID){
    return WishListprductIDs.contains(productID);
  }
  ///////////// add prod
  void addProductToWishlist(String productID) async {
    emit(AddProductToWishLishLoadingState());
    var either = await addProductToWishlistUseCase.invoke(productID);
    return either.fold(
        (failure) => emit(AddProductToWishLishErrorState(failures: failure)),
        (addprod) {
          WishListprductIDs.add(productID);
          emit(AddProductToWishLishSucessState(addToWishlistResponseEntity: addprod));
        } );
  }
  ///// object 
   static WishListCubit get(context) => BlocProvider.of<WishListCubit>(context);
}
