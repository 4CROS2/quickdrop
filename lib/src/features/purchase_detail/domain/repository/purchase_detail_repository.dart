import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';

abstract class PurchaseDetailRepository {
  Stream<PurchaseEntity> getProductData({
    required String orderId,
    required String sellerId,
  });
}
