import 'package:quickdrop/src/domain/entity/home_products.dart';

abstract class HomeDataRepository {
  Future<List<HomeProductsEntity>> getHomeData();
}
