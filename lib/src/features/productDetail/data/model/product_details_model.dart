import 'package:quickdrop/src/features/home/data/model/products_model.dart';
import 'package:quickdrop/src/features/home/data/model/sellers_model.dart';
import 'package:quickdrop/src/features/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/features/home/domain/entity/products_entity.dart';

class ProductDetailsModel extends ProductDetailEntity {
  ProductDetailsModel({
    required super.productId,
    required super.productName,
    required super.basePrice,
    required super.description,
    required super.baseImages,
    required super.tags,
    required super.sellerData,
    required super.relatedProducts,
  });

  static ProductDetailsModel fromJson({required Map<String, dynamic> json}) {
    final List<dynamic> jsonImages = List<String>.from(
      json['base_images'] ?? <String>[],
    );
    final List<String> jsonTags =
        List<String>.from(json['tags'] ?? <dynamic>[]);
    final List<Map<String, dynamic>> jsonProducts =
        List<Map<String, dynamic>>.from(
      json['related_products'] ?? <dynamic>[],
    );

    final List<String> images = List<String>.from(jsonImages);
    final List<String> tags = List<String>.from(jsonTags);

    final List<ProductsEntity> relatedProducts = jsonProducts
        .map<ProductsModel>(
          (Map<String, dynamic> product) => ProductsModel.fromJson(
            json: product,
          ),
        )
        .toList();

    return ProductDetailsModel(
      productId: json['id'],
      productName: json['name'] ?? '',
      basePrice: json['base_price'] ?? 0,
      description: json['description'] ?? '',
      baseImages: images,
      tags: tags,
      sellerData: SellersModel.fromJson(
        json: json['seller_data'],
      ),
      relatedProducts: relatedProducts,
    );
  }
}
