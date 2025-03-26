import 'package:quickdrop/src/features/home/domain/entity/home_entity.dart';

abstract class HomeDataRepository {
  Future<HomeEntity> getHomeData();
}
