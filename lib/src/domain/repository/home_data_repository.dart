import 'package:quickdrop/src/domain/entity/home_entity.dart';

abstract class HomeDataRepository {
  Future<HomeEntity> getHomeData();
}
