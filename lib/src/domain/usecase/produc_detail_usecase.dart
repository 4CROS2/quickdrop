import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/domain/repository/product_detail_repository.dart';

class ProducDetailUsecase {
  ProducDetailUsecase({
    required ProductDetailRepository repository,
  }) : _repository = repository;
  final ProductDetailRepository _repository;

  Future<ProductsEntity> getProductDetail({required String productId}) =>
      _repository.getProductData(
        productId: productId,
      );
}
