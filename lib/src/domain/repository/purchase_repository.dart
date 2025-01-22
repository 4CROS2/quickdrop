import 'package:quickdrop/src/domain/entity/purchase_entity.dart';

abstract class PurchaseRepository {
  Future<void> purchaseProduct({
    required PurchaseEntity product,
  });
}
