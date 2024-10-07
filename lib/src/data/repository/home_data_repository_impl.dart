import 'package:quickdrop/src/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/model/home_products_model.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';

class IHomeDataRepository extends HomeDataRepository {
  IHomeDataRepository({
    required HomeDatasource datasource,
  }) : _datasource = datasource;
  final HomeDatasource _datasource;
  @override
  Future<List<HomeProductsModel>> getHomeData(
      {required String userToken}) async {
    final Map<String, dynamic> response =
        await _datasource.getHomeData(token: userToken);
    final List<dynamic> jsonData = response['products'];
    return jsonData
        .map(
          // ignore: always_specify_types
          (product) => HomeProductsModel.fromJson(json: product),
        )
        .toList();
  }
}
