import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/domain/repository/product_detail_repository.dart';

class ProducDetailUsecase {
  ProducDetailUsecase({
    required ProductDetailRepository repository,
  }) : _repository = repository;
  final ProductDetailRepository _repository;

  Future<ProductDetailEntity> getProductDetail({required String productId}) =>
      _repository.getProductData(
        productId: productId,
      );
}
