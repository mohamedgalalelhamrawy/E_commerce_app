
class AddProductToCartResponseEntity {
    final String? message;
    final int? numOfCartItems;
    final String? cartId;
    final AddToCartDataEntity? data;
    final String? statusMsg;

    AddProductToCartResponseEntity({
         this.message,
         this.numOfCartItems,
         this.cartId,
         this.data,
         this.statusMsg
    });}
class AddToCartDataEntity {
    final String? id;
    final String? cartOwner;
    final List<AddToCartProductEntity>? products;
    final int? totalCartPrice;
    AddToCartDataEntity({
         this.id,
         this.cartOwner,
         this.products,
         this.totalCartPrice,
    });}
class AddToCartProductEntity {
    final int? count;
    final String? productID;
    final int? price;

    AddToCartProductEntity({
         this.count,
         this.productID,
         this.price,
    });

}
