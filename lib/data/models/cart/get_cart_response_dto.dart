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
          data: GetCartDataResponseDto.fromJson(json["data"]),
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
  final ProductResponseDto? product;
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
        product: ProductResponseDto.fromJson(json["product"]),
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
