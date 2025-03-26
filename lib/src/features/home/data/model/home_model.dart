import 'package:quickdrop/src/features/home/data/model/products_model.dart';
import 'package:quickdrop/src/features/home/data/model/sellers_model.dart';
import 'package:quickdrop/src/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.products,
    required super.sellers,
    required super.lastSeen,
  });

  static HomeModel fromJson({required Map<String, dynamic> json}) {
    final List<Map<String, dynamic>> products =
        List<Map<String, dynamic>>.from(json['products']);

    final List<Map<String, dynamic>> sellers =
        List<Map<String, dynamic>>.from(json['sellers']);

    final List<Map<String, dynamic>> lastSeen =
        List<Map<String, dynamic>>.from(json['last_seen']);

    return HomeModel(
      products: products
          .map((Map<String, dynamic> product) =>
              ProductsModel.fromJson(json: product))
          .toList(),
      sellers: sellers
          .map((Map<String, dynamic> seller) =>
              SellersModel.fromJson(json: seller))
          .toList(),
      lastSeen: lastSeen
          .map((Map<String, dynamic> product) =>
              ProductsModel.fromJson(json: product))
          .toList(),
    );
  }
}
