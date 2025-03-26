import 'package:quickdrop/src/features/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/features/productDetail/domain/repository/product_detail_repository.dart';

class ProducDetailUsecase {
  ProducDetailUsecase({
    required ProductDetailRepository repository,
  }) : _repository = repository;
  final ProductDetailRepository _repository;

  Future<ProductDetailEntity> getProductDetail({required String productId}) =>
      _repository.getProductData(
        productId: productId,
      );

  Future<void> addToLastSeen({required String productId}) async {
    await _repository.addToLastSeen(productId: productId);
  }
}
