import 'package:quickdrop/src/data/model/products_model.dart';
import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';

class ProductDetailsModel extends ProductDetailEntity {
  ProductDetailsModel({
    required super.productName,
    required super.basePrice,
    required super.description,
    required super.baseImages,
    required super.tags,
    required super.sellerData,
    required super.relatedProducts,
  });

  static ProductDetailsModel fromJson({required Map<String, dynamic> json}) {
    final List<dynamic> jsonImages = json['base_images'] ?? <dynamic>[];
    final List<dynamic> jsonTags = json['tags'] ?? <dynamic>[];
    final List<dynamic> jsonProducts = json['related_products'];

    final List<String> images = List<String>.from(jsonImages);
    final List<String> tags = List<String>.from(jsonTags);

    final List<ProductsEntity> relatedProducts = jsonProducts
        .map(
          // ignore: always_specify_types
          (e) => ProductsModel.fromJson(
            json: e,
          ),
        )
        .toList();

    return ProductDetailsModel(
        productName: json['name'] ?? '',
        basePrice: json['base_price'] ?? 0,
        description: json['description'] ?? '',
        baseImages: images,
        tags: tags,
        sellerData: SellerModel.fromJson(
          json: json['seller_data'],
        ),
        relatedProducts: relatedProducts);
  }
}

class SellerModel extends SellerData {
  SellerModel({
    required super.companyName,
    required super.brand,
    required super.sellerId,
  });
  static SellerModel fromJson({required Map<String, dynamic> json}) {
    return SellerModel(
      companyName: json['company_name'] ?? '',
      brand: json['brand'] ?? '',
      sellerId: json['seller_id'] ?? '',
    );
  }
}
