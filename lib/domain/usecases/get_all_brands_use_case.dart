 
  import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllbrandsUseCase {
  HomeRepository homeRepository;
 GetAllbrandsUseCase({required this.homeRepository});

  Future<Either<Failures,GetAllGategoriesOrBrandsEntity>> invoke (){
     return homeRepository.getAllBrands();
  } 
 }