import 'package:quickdrop/src/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/model/products_model.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';

class IHomeDataRepository extends HomeDataRepository {
  IHomeDataRepository({
    required HomeDatasource datasource,
  }) : _datasource = datasource;
  final HomeDatasource _datasource;
  @override
  Future<List<ProductsModel>> getHomeData() async {
    final Map<String, dynamic> response = await _datasource.getHomeData();
    final List<dynamic> jsonData = response['products'];
    return jsonData
        .map(
          // ignore: always_specify_types
          (product) => ProductsModel.fromJson(json: product),
        )
        .toList();
  }
}
