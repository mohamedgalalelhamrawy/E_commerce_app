
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';

class GetCartResponseEntity {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCartDataResponseEntity? data;
  final String? message;
  final String? statusMsg;

  GetCartResponseEntity(
    {this.status,
      this.numOfCartItems,
      this.cartId,
      this.data,
      this.message,
      this.statusMsg});
}

class GetCartDataResponseEntity {
  final String? id;
  final String? cartOwner;
  final List<ProductElementEntity>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

 GetCartDataResponseEntity({
     this.id,
     this.cartOwner,
     this.products,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.totalCartPrice,
  });
  
}

class ProductElementEntity {
  final int? count;
  final String? id;
  final ProductResponseEntity? product;
  final int? price;

  ProductElementEntity({
     this.count,
     this.id,
     this.product,
     this.price,
  });
  
}

