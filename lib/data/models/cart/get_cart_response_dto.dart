// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'package:e_commerce_app/data/models/get_all_products_dto.dart';
import 'package:e_commerce_app/domain/entities/cart/get_cart_response_entity.dart';

class GetCartResponseDto {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCartDataResponseDto? data;
  final String? message;
  final String? statusMsg;

  GetCartResponseDto(
      {this.status,
      this.numOfCartItems,
      this.cartId,
      this.data,
      this.message,
      this.statusMsg});

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) =>
      GetCartResponseDto(
          status: json["status"],
          numOfCartItems: json["numOfCartItems"],
          cartId: json["cartId"],
          data: json["data"] != null
              ? GetCartDataResponseDto.fromJson(json["data"])
              : null,
          message: json["message"],
          statusMsg: json["statusMsg"]);

  GetCartResponseEntity toEntity() {
    return GetCartResponseEntity(
      cartId: cartId,
      data: data?.toEntity(),
      message: message,
      numOfCartItems: numOfCartItems,
      status: status,
      statusMsg: statusMsg,
    );
  }
}

class GetCartDataResponseDto {
  final String? id;
  final String? cartOwner;
  final List<ProductElementDto>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetCartDataResponseDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory GetCartDataResponseDto.fromJson(Map<String, dynamic> json) =>
      GetCartDataResponseDto(
        id: json["_id"],
        cartOwner: json["cartOwner"],
        products: json["products"] != null
            ? (json["products"] as List)
                .map((x) => ProductElementDto.fromJson(x))
                .toList()
            : null,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
        v: json["__v"],
        totalCartPrice: json["totalCartPrice"],
      );

  GetCartDataResponseEntity toEntity() {
    return GetCartDataResponseEntity(
      cartOwner: cartOwner,
      createdAt: createdAt,
      id: id,
      products: products?.map((x) => x.toEntity()).toList(),
      totalCartPrice: totalCartPrice,
      updatedAt: updatedAt,
      v: v,
    );
  }
}

class ProductElementDto {
  final int? count;
  final String? id;
  final CartProductDto? product;
  final int? price;

  ProductElementDto({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory ProductElementDto.fromJson(Map<String, dynamic> json) =>
      ProductElementDto(
        count: json["count"],
        id: json["_id"],
        product: json["product"] != null
            ? CartProductDto.fromJson(json["product"])
            : null,
        price: json["price"],
      );

  ProductElementEntity toEntity() {
    return ProductElementEntity(
      count: count,
      id: id,
      price: price,
      product: product?.toEntity(),
    );
  }
}

class CartProductDto {
  final List<CartCategoryDto>? subcategory;
  final String? id;
  final String? title;
  final int? quantity;
  final String? imageCover;
  final CartCategoryDto? category;
  final CartCategoryDto? brand;
  final double? ratingsAverage;
  final String? datumId;

  CartProductDto({
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

  factory CartProductDto.fromJson(Map<String, dynamic> json) {
    return CartProductDto(
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List)
              .map((e) => CartCategoryDto.fromJson(e))
              .toList()
          : [],

      id: json['_id'],
      title: json['title'],
      quantity: json['quantity'],
      imageCover: json['imageCover'],

      category: json['category'] != null
          ? CartCategoryDto.fromJson(json['category'])
          : null,

      brand: json['brand'] != null
          ? CartCategoryDto.fromJson(json['brand'])
          : null,

      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      datumId: json['id'],
    );
  }

  CartProductEntity toEntity() {
    return CartProductEntity(
      subcategory: subcategory?.map((e) => e.toEntity()).toList() ?? [],
      id: id,
      title: title,
      quantity: quantity,
      imageCover: imageCover,
      category: category?.toEntity(),
      brand: brand?.toEntity(),
      ratingsAverage: ratingsAverage,
      datumId: datumId,
    );
  }
}

class CartCategoryDto {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CartCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory CartCategoryDto.fromJson(Map<String, dynamic> json) {
    return CartCategoryDto(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  CartCategoryEntity toEntity() {
    return CartCategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}
