import 'package:e_commerce_app/domain/entities/wishlist/add_to_wishlist_entity.dart';

class AddToWishlistResponseDto {
  final String? status;
  final String? message;
  final List<String>? data;
  final String? statusMsg;

  AddToWishlistResponseDto(
      {this.status, this.message, this.data, this.statusMsg});

  factory AddToWishlistResponseDto.fromJson(Map<String, dynamic> json) =>
      AddToWishlistResponseDto(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? List<String>.from((json["data"] as List).map((x) => x))
            : null,
        statusMsg: json["statusMsg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.map((x) => x).toList(),
        "statusMsg": statusMsg
      };

  AddToWishlistResponseEntity toEntity() {
    return AddToWishlistResponseEntity(
        data: data, message: message, status: status, statusMsg: statusMsg);
  }
}
