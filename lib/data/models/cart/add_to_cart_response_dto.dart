
import 'package:e_commerce_app/domain/entities/cart/add_to_cart_response_entity.dart';

class AddProductToCartResponseDto {
    final String? status;
    final String? message;
    final int? numOfCartItems;
    final String? cartId;
    final AddToCartDataDto? data;
    final String? statusMsg;

    AddProductToCartResponseDto({
         this.status,
         this.message,
         this.numOfCartItems,
         this.cartId,
         this.data,
         this.statusMsg
    });

    factory AddProductToCartResponseDto.fromJson(Map<String, dynamic> json) => AddProductToCartResponseDto(
        status: json["status"],
        message: json["message"],
        numOfCartItems: json["numOfCartItems"],
        cartId: json["cartId"],
        data: AddToCartDataDto.fromJson(json["data"]),
        statusMsg:json["statusMsg"]
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "numOfCartItems": numOfCartItems,
        "cartId": cartId,
        "data": data?.toJson(),
    };

   AddProductToCartResponseEntity toEntity (){
    return AddProductToCartResponseEntity(
      cartId: cartId,
      data: data?.toEntity(),
      message: message,
      numOfCartItems: numOfCartItems,
      statusMsg: statusMsg, 
    );
   }
}

class AddToCartDataDto {
    final String? id;
    final String? cartOwner;
    final List<AddToCartProductDto>? products;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final int? totalCartPrice;

    AddToCartDataDto({
         this.id,
         this.cartOwner,
         this.products,
         this.createdAt,
         this.updatedAt,
         this.v,
         this.totalCartPrice,
    });

    factory AddToCartDataDto.fromJson(Map<String, dynamic> json) => AddToCartDataDto(
        id: json["_id"],
        cartOwner: json["cartOwner"],
        products: json["products"] != null 
    ? (json["products"] as List).map((x) => AddToCartProductDto.fromJson(x)).toList()
    : null,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        totalCartPrice: json["totalCartPrice"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cartOwner": cartOwner,
        "products": products?.map((x) => x.toJson()).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "totalCartPrice": totalCartPrice,
    };

  AddToCartDataEntity toEntity(){
    return AddToCartDataEntity(
      cartOwner: cartOwner,
      id: id,
      products: products?.map((x)=>x.toEntity()).toList(),
      totalCartPrice: totalCartPrice,
    );
  }

}

class AddToCartProductDto {
    final int? count;
    final String? id;
    final String? productID;
    final int? price;

    AddToCartProductDto({
         this.count,
         this.id,
         this.productID,
         this.price,
    });

    factory AddToCartProductDto.fromJson(Map<String, dynamic> json) => AddToCartProductDto(
        count: json["count"],
        id: json["_id"],
        productID: json["product"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "_id": id,
        "product": productID,
        "price": price,
    };
   
    AddToCartProductEntity toEntity (){
      return AddToCartProductEntity(
        count: count,
        price: price,
        productID: productID
      );
    }
}
