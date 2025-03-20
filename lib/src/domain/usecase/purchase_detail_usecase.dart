import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/repository/purchase_detail_repository.dart';

class PurchaseDetailUsecase {
  const PurchaseDetailUsecase({
    required PurchaseDetailRepository repository,
  }) : _repository = repository;

  final PurchaseDetailRepository _repository;

  Stream<PurchaseEntity> getPurchaseDetail({
    required String orderId,
    required String sellerId,
  }) {
    return _repository.getProductData(
      orderId: orderId,
      sellerId: sellerId,
    );
  }
}
