import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';

abstract class ProductDetailRepository {
  Future<ProductDetailEntity> getProductData({
    required String productId,
  });
}
