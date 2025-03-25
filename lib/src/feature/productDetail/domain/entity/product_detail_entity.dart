import 'package:quickdrop/src/feature/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/feature/home/domain/entity/sellers_entity.dart';

class ProductDetailEntity {
  const ProductDetailEntity({
    required this.productId,
    required this.productName,
    required this.basePrice,
    required this.description,
    required this.baseImages,
    required this.tags,
    required this.sellerData,
    required this.relatedProducts,
  });

  final String productId;
  final String productName;
  final int basePrice;
  final String description;
  final List<String> baseImages;
  final List<String> tags;
  final SellersEntity sellerData;
  final List<ProductsEntity> relatedProducts;
}
