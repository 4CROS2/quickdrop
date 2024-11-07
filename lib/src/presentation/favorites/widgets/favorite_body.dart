import 'package:flutter/material.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/favorites/widgets/favorite_product_tile.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({
    required this.favorites,
    required this.onDismissed,
    super.key,
  });
  final List<ProductsEntity> favorites;
  final Function(String) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ...List<FavoriteProductTile>.generate(
        favorites.length,
        (int index) => FavoriteProductTile(
          favorite: favorites[index],
          onDismissed: () => onDismissed(favorites[index].id),
        ),
      )
    ]);
  }
}
