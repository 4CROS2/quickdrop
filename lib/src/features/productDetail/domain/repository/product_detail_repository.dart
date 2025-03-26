import 'package:quickdrop/src/features/productDetail/domain/entity/product_detail_entity.dart';

abstract class ProductDetailRepository {
  Future<ProductDetailEntity> getProductData({
    required String productId,
  });

  Future<void> addToLastSeen({
    required String productId,
  });
}
