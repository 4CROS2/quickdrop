import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';

class FavoriteProductTile extends StatelessWidget {
  const FavoriteProductTile({
    required ProductsEntity favorite,
    required this.onDismissed,
    super.key,
  }) : _favorite = favorite;

  final ProductsEntity _favorite;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(_favorite.id), // Asegúrate de usar una clave única
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        onDismissed(); // Llama a la función que maneja la eliminación
      },
      background: Container(
        color: Colors.red, // Color de fondo al deslizar
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: Constants.mainPadding.top),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.mainPadding.right),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 6,
              borderRadius: Constants.mainBorderRadius,
              child: Padding(
                padding: Constants.mainPadding / 2,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: Constants.mainBorderRadius / 2,
                      child: CachedNetworkImage(
                        imageUrl: _favorite.baseImages[0],
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Text(_favorite.name),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
