 import 'package:e_commerce_app/data/models/get_all_products_dto.dart';
import 'package:e_commerce_app/domain/entities/wishlist/get_products_wishlist_entity.dart';

class GetWishlistResponseDto {
  final String? message;
  final String? status;
  final num? count;
  final List< ProductResponseDto>? data;
  final String? statusMsg;

  GetWishlistResponseDto({
    this.status,
    this.count,
    this.data,
    this.statusMsg,
    this.message
  });

  factory GetWishlistResponseDto.fromJson(Map<String, dynamic> json) =>
      GetWishlistResponseDto(
        status: json["status"],
        count: json["count"],
        statusMsg: json["statusMsg"],
        data: json["data"] != null
            ? List< ProductResponseDto>.from(
                (json["data"] as List).map((x) =>  ProductResponseDto.fromJson(x)))
            : null,
        message: json["message"]    
      );

  GetWishlistResponseEntity toEntity() {
    return GetWishlistResponseEntity(
      status: status,
      count: count,
      statusMsg: statusMsg,
      data: data?.map((productDto) => productDto.toEntity()).toList(),
      message:message
    );
  }
}