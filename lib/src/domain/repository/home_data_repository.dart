import 'package:quickdrop/src/domain/entity/products_entity.dart';

abstract class HomeDataRepository {
  Future<List<ProductsEntity>> getHomeData();
}
