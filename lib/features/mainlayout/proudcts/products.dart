import 'package:e_commerce_app/core/di/service_locator.dart';
import 'package:e_commerce_app/features/mainlayout/proudcts/cubit/cubit/products_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/proudcts/widgets/customproductsitem.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProuductsScreen extends StatelessWidget {
 ProuductsScreen({super.key});
 var viewmodel = sl<ProductsCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: viewmodel..getAllProducts(),
          builder: (context, state) {
            if(state is ProductsSccessState){
              return GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productDetailsScreen);
                  },
                  child: Customproductsitem(productResponseEntity:state.getAllProductsResponseEntity.data![index] ,),
                );
              },
            );
            } else if(state is ProductsErrorState){
              return Center(child: Text(state.failures.errmessage),);
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
