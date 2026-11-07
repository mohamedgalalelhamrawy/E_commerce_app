
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
  final CartProductEntity? product;
  final int? price;

  ProductElementEntity({
     this.count,
     this.id,
     this.product,
     this.price,
  });
}


class CartProductEntity {
  final List<CartCategoryEntity>? subcategory;
  final String? id;
  final String? title;
  final int? quantity;
  final String? imageCover;
  final CartCategoryEntity? category;
  final CartCategoryEntity? brand;
  final double? ratingsAverage;
  final String? datumId;

  CartProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.datumId,
  });

}

class CartCategoryEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CartCategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}

