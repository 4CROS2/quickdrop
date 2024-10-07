import 'package:quickdrop/src/domain/entity/home_products.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';

class HomeDataUsecase {
  HomeDataUsecase({
    required HomeDataRepository repository,
  }) : _repository = repository;
  final HomeDataRepository _repository;

  Future<List<HomeProductsEntity>> products(
          {required String userToken}) async =>
      await _repository.getHomeData(
        userToken: userToken,
      );
}
