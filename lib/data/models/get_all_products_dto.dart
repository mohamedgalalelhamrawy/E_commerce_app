import 'package:e_commerce_app/data/models/get_all_gategories_dto.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';

class GetAllProductsResponseDto {
  final int? results;
  final List<ProductResponseDto>? data;
  final String? message;
  final String? statusMsg;

  GetAllProductsResponseDto({
    this.results,
    this.data,
    this.message,
    this.statusMsg
  });
  
  factory GetAllProductsResponseDto.fromJson(Map<String, dynamic> json) =>
      GetAllProductsResponseDto(
        message: json["message"],
        statusMsg: json["statusMsg"],
        results: json["results"],
        data: List<ProductResponseDto>.from(
            json["data"].map((x) => ProductResponseDto.fromJson(x))),
      );

     GetAllProductsResponseEntity toEntity(){
      return GetAllProductsResponseEntity(
         data: data?.map((x)=>x.toEntity()).toList(),
         results: results,
         message: message,
         statusMsg: statusMsg
      );
     } 
}

class ProductResponseDto {
  final int? sold;
  final List<String>? images;
  final List<CategoryOrBrandResponseDto>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryOrBrandResponseDto? category;
  final CategoryOrBrandResponseDto? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? datumId;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  ProductResponseDto({
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

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductResponseDto(
        sold: json["sold"],
        images: json["images"] != null
            ? (json["images"] as List).map((x) => x.toString()).toList()
            : [],
        subcategory: json["subCategory"] != null
            ? (json["subCategory"] as List)
                .map((x) => CategoryOrBrandResponseDto.fromJson(x))
                .toList()
            : [],
        ratingsQuantity: json["ratingsQuantity"],
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        imageCover: json["imageCover"],
        category: json['category'] != null
            ? CategoryOrBrandResponseDto.fromJson(json['category'])
            : null,
        brand: json['brand'] != null
            ? CategoryOrBrandResponseDto.fromJson(json['brand'])
            : null,
        ratingsAverage: (json["ratingsAverage"] as num?)?.toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        datumId: json["id"],
        priceAfterDiscount: json["priceAfterDiscount"],
        availableColors: json["availableColors"] == null
            ? []
            : List<dynamic>.from(json["availableColors"]!.map((x) => x)),
      );

  ProductResponseEntity toEntity() {
    return ProductResponseEntity(
      sold: sold,
      images: images,
      subcategory: subcategory?.map((x)=>x.toEntity()).toList() ?? [],
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category?.toEntity(),
      brand: brand?.toEntity(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      datumId: datumId,
      priceAfterDiscount: priceAfterDiscount,
      availableColors: availableColors,
    );
  }
}
