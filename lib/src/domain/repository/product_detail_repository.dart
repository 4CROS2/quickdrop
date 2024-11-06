import 'package:quickdrop/src/domain/entity/products_entity.dart';

abstract class ProductDetailRepository {
  Future<ProductsEntity> getProductData({
    required String productId,
  });
}
