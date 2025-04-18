import 'package:quickdrop/src/features/cart/data/model/cart_prodruct_model.dart';
import 'package:quickdrop/src/features/cart/domain/repository/cart_datasource_repository.dart';
import 'package:quickdrop/src/features/cart/domain/repository/cart_repository.dart';

class ICartRepository implements CartRepository {
  ICartRepository({
    required CartDatasourceRepository datasource,
  }) : _datasource = datasource;

  final CartDatasourceRepository _datasource;

  @override
  Stream<List<CartProdructModel>> getCartProducts() {
    try {
      final Stream<List<Map<String, dynamic>>> response =
          _datasource.getCartProducts();

      return response.map(
        (List<Map<String, dynamic>> event) {
          return event
              .map(
                (Map<String, dynamic> product) => CartProdructModel.fromJson(
                  json: product,
                ),
              )
              .toList();
        },
      );
    } catch (e) {
      throw Exception('error al organizar los datos: $e');
    }
  }
}
