import 'package:quickdrop/src/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/model/home_model.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';

class IHomeDataRepository extends HomeDataRepository {
  IHomeDataRepository({
    required IHomeDatasource datasource,
  }) : _datasource = datasource;
  final IHomeDatasource _datasource;
  @override
  Future<HomeModel> getHomeData() async {
    final Map<String, dynamic> response = await _datasource.getHomeData();
    return HomeModel.fromJson(json: response);
  }
}
