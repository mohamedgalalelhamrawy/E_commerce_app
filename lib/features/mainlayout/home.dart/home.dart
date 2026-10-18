import 'package:e_commerce_app/core/components/customcarouselslider.dart';
import 'package:e_commerce_app/core/di/service_locator.dart';
import 'package:e_commerce_app/features/mainlayout/home.dart/cubit/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/home.dart/widgets/customcategoryitem.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var viewmodel = sl<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarouselSlider(height: 200.h, imgList: viewmodel.advsList),
            SizedBox(
              height: 16.h,
            ),
            Text(
              Constants.categories,
              style: Appstyles.homeLabels,
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 250,
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: viewmodel..getAllCategories(),
                buildWhen: (previous, current) =>
                    current is GetAllCategoriesErrorState ||
                    current is GetAllCategoriesLoadingState ||
                    current is GetAllCategoriesSuccessState,
                builder: (context, state) {
                  if (state is GetAllCategoriesSuccessState) {
                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            16, // المسافة الأفقية بين العمود والعمود
                        crossAxisSpacing: 16, // المسافة الرأسية بين الصف والصف
                        // childAspectRatio: 1.2, // نسبة العرض للارتفاع لكل كارت
                      ),
                      itemCount: state.getAllGategoriesEntity.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CustomCategoryOrBrandItem(
                          category: state.getAllGategoriesEntity.data![index],
                        );
                      },
                    );
                  } else if (state is GetAllCategoriesErrorState) {
                    return Center(
                      child: Text(state.failures.errmessage),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            ///////////////////////////////////////////////////////
            SizedBox(
              height: 16.h,
            ),
            Text(Constants.brands, style: Appstyles.homeLabels),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 250,
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: viewmodel..getAllBrands(),
                buildWhen: (previous, current) =>
                    current is GetAllBrandsSuccessState ||
                    current is GetAllBrandsErrorState ||
                    current is GetAllBrandsLoadingState,
                builder: (context, state) {
                  if (state is GetAllBrandsSuccessState) {
                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            16, // المسافة الأفقية بين العمود والعمود
                        crossAxisSpacing: 16, // المسافة الرأسية بين الصف والصف
                        // childAspectRatio: 1.2, // نسبة العرض للارتفاع لكل كارت
                      ),
                      itemCount: state.getAllbrandsEntity.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CustomCategoryOrBrandItem(
                          category: state.getAllbrandsEntity.data![index],
                        );
                      },
                    );
                  } else if (state is GetAllBrandsErrorState) {
                    return Center(
                      child: Text(state.failures.errmessage),
                    );
                  } else if (state is GetAllBrandsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
