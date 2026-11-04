import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';

class GetWishlistResponseEntity {
  final String? status;
  final num? count;
  final List< ProductResponseEntity>? data;
  final String? statusMsg;
  final String? message;

  GetWishlistResponseEntity({
    this.status,
    this.count,
    this.data,
    this.statusMsg,
    this.message
  });
}