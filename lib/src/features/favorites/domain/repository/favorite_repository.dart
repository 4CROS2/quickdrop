import 'package:quickdrop/src/features/favorites/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/features/home/domain/entity/products_entity.dart';

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

  Future<List<ProductsEntity>> getUserFavorites();
}
