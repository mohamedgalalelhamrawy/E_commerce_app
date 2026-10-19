
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';

class GetAllProductsResponseEntity {
  final int? results;
  final List<ProductResponseEntity>? data;
  final String? message;
  final String? statusMsg;

  GetAllProductsResponseEntity({
    this.results,
    this.data,
    this.message,
    this.statusMsg
  });

}

class ProductResponseEntity {
  final int? sold;
  final List<String>? images;
  final List<CategoryOrBrandResponseEntity>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryOrBrandResponseEntity? category;
  final CategoryOrBrandResponseEntity? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? datumId;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  ProductResponseEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.datumId,
    this.priceAfterDiscount,
    this.availableColors,
  });
}
