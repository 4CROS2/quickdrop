import 'package:quickdrop/src/domain/entity/purchase_entity.dart';

abstract class PurchaseDetailRepository {
  Stream<PurchaseEntity> getProductData({
    required String orderId,
    required String sellerId,
  });
}
