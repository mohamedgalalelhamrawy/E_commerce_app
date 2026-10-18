import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';
import 'package:e_commerce_app/domain/usecases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/usecases/get_all_categories_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllbrandsUseCase})
      : super(HomeInitial());
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllbrandsUseCase getAllbrandsUseCase;
  List<String> advsList = [AppAssets.adv1, AppAssets.adv2, AppAssets.adv3];
  void getAllCategories() async {
    emit(GetAllCategoriesLoadingState());

    var either = await getAllCategoriesUseCase.invoke();
    either.fold((failure) {
      emit(GetAllCategoriesErrorState(failures: failure));
    }, (allcategorys) {
      emit(GetAllCategoriesSuccessState(getAllGategoriesEntity: allcategorys));
    });
  }

  void getAllBrands() async {
    emit(GetAllBrandsLoadingState());
    var either = await getAllbrandsUseCase.invoke();
    either.fold((failure) {
      emit(GetAllBrandsErrorState(failures: failure));
    }, (allbrands) {
      emit(GetAllBrandsSuccessState(getAllbrandsEntity: allbrands));
    });
  }
}
