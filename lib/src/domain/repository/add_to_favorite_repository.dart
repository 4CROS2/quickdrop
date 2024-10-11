import 'package:quickdrop/src/domain/entity/add_favorite_entity.dart';

abstract class AddToFavoriteRepository {
  Future<AddFavoriteEntity> checkFavorite({
    required String productId,
  });
  Future<AddFavoriteEntity> addToFavorite({
    required String productId,
  });

  Future<AddFavoriteEntity> removeFavorite({
    required String productId,
  });
}
