import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/pruchase/domain/repository/purchase_repository.dart';

class PurchaseUsecase {
  PurchaseUsecase({
    required PurchaseRepository repository,
  }) : _repository = repository;

  final PurchaseRepository _repository;

  Future<String> purchaseProduct({required PurchaseEntity product}) async =>
      await _repository.purchaseProduct(product: product);
}
