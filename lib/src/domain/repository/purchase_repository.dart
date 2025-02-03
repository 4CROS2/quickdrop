import 'package:quickdrop/src/domain/entity/purchase_entity.dart';

abstract class PurchaseRepository {
  Future<String> purchaseProduct({
    required PurchaseEntity product,
  });
}
