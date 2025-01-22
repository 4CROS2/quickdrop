import 'package:quickdrop/src/domain/entity/products_entity.dart';

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
  final SellerData sellerData;
  final List<ProductsEntity> relatedProducts;
}

class SellerData {
  SellerData({
    required this.companyName,
    required this.brand,
    required this.sellerId,
  });
  final String companyName;
  final String brand;
  final String sellerId;
}
