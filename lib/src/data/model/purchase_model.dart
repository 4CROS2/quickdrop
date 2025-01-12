import 'package:quickdrop/src/domain/entity/purchase_entity.dart';

class PurchaseModel extends PurchaseEntity {
  const PurchaseModel({
    required super.buyerId,
    required super.orderId,
    required super.sellerId,
    required super.productId,
    required super.orderTime,
    required super.currentPrice,
    required super.quantity,
    required super.description,
  });

  static String _getCurrentTime() {
    final DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}';
  }

  static PurchaseModel fromJson({required Map<String, dynamic> json}) {
    return PurchaseModel(
        buyerId: json['buyer_id'],
        productId: json['product_id'],
        sellerId: json['seller_id'],
        orderTime: json['order_time'],
        quantity: json['quantity'],
        currentPrice: json['sell_price'],
        orderId: json['order_id'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return <String, Object>{
      'buyer_id': buyerId,
      'order_id': orderId,
      'product_id': productId,
      'seller_id': sellerId,
      'orderTime': orderTime,
      'quantity': quantity,
      'sell_price': currentPrice,
      'description': description,
    };
  }

  factory PurchaseModel.fromEntity({required PurchaseEntity entity}) {
    return PurchaseModel(
      buyerId: entity.buyerId,
      currentPrice: entity.currentPrice,
      orderId: entity.orderId,
      productId: entity.productId,
      quantity: entity.quantity,
      sellerId: entity.sellerId,
      description: entity.description,
      orderTime: _getCurrentTime(),
    );
  }
}
