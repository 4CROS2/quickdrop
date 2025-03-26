import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';

abstract class PurchaseRepository {
  Future<String> purchaseProduct({
    required PurchaseEntity product,
  });
}
