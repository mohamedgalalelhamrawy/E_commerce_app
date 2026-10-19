import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/domain/usecases/get_all_products_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getAllProductsUseCase})
      : super(ProductsInitial());
  GetAllProductsUseCase getAllProductsUseCase;

  void getAllProducts() async {
    emit(ProductsLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
        (failure) => emit(ProductsErrorState(failures: failure)),
        (products) => emit(ProductsSccessState(getAllProductsResponseEntity: products)));
  }
}
