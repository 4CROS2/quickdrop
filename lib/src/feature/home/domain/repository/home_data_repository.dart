import 'package:quickdrop/src/feature/home/domain/entity/home_entity.dart';

abstract class HomeDataRepository {
  Future<HomeEntity> getHomeData();
}
