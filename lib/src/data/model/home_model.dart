import 'package:quickdrop/src/data/model/products_model.dart';
import 'package:quickdrop/src/data/model/sellers_model.dart';
import 'package:quickdrop/src/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.products,
    required super.sellers,
  });

  static HomeModel fromJson({required Map<String, dynamic> json}) {
    final List<Map<String, dynamic>> products =
        List<Map<String, dynamic>>.from(json['products']);

    final List<Map<String, dynamic>> sellers =
        List<Map<String, dynamic>>.from(json['sellers']);

    return HomeModel(
      products: products
          .map((Map<String, dynamic> product) =>
              ProductsModel.fromJson(json: product))
          .toList(),
      sellers: sellers
          .map((Map<String, dynamic> seller) =>
              SellersModel.fromJson(json: seller))
          .toList(),
    );
  }
}
