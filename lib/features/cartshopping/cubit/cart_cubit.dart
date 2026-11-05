import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/cart/add_to_cart_response_entity.dart';
import 'package:e_commerce_app/domain/entities/cart/get_cart_response_entity.dart';
import 'package:e_commerce_app/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/usecases/cart/get_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  AddProductToCartUseCase addProductToCartUseCase;
  GetCartUseCase getCartUseCase;
  CartCubit(
      {required this.addProductToCartUseCase, required this.getCartUseCase})
      : super(CartInitial());

  void addProductToCart(String productID) async {
    emit(AddProductToCartLoadingState());
    var either = await addProductToCartUseCase.invoke(productID);
    either.fold((error) {
      emit(AddProductToCartErrorState(failures: error));
    }, (addprod) {
      emit(AddProductToCartSuccessState(
          addProductToCartResponseEntity: addprod));
    });
  }
  ////////////
  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
  ///////////
  void getProductsOfCart() async {
    emit(GetProductsOfCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(GetProductsOfCartErrorState(failures: error));
    }, (getdata) {
      emit(GetProductsOfCartSuccessState(getCartResponseEntity: getdata));
    });
  }
}
