import 'package:quickdrop/src/features/home/domain/entity/home_entity.dart';
import 'package:quickdrop/src/features/home/domain/repository/home_data_repository.dart';

class HomeDataUsecase {
  HomeDataUsecase({
    required HomeDataRepository repository,
  }) : _repository = repository;
  final HomeDataRepository _repository;

  Future<HomeEntity> products() async => await _repository.getHomeData();
}
