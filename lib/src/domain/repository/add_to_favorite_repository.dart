import 'package:quickdrop/src/domain/entity/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<FavoriteEntity> checkFavorite({
    required String productId,
  });
  Future<FavoriteEntity> addToFavorite({
    required String productId,
  });

  Future<FavoriteEntity> removeFavorite({
    required String productId,
  });
}
