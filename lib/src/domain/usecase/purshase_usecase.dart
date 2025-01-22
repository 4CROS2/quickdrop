import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/repository/purchase_repository.dart';

class PurchaseUsecase {
  PurchaseUsecase({
    required PurchaseRepository repository,
  }) : _repository = repository;
  final PurchaseRepository _repository;
  Future<void> purchaseProduct({required PurchaseEntity product}) async =>
      await _repository.purchaseProduct(product: product);
}
