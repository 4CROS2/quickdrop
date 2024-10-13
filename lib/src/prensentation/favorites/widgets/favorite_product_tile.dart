import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/prensentation/product/product.dart';

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
    return Padding(
      padding: EdgeInsets.only(top: Constants.mainPadding.top),
      child: Dismissible(
        key: ValueKey<String>(_favorite.id),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) => onDismissed(),
        background: Container(
          color: Colors.red, // Color de fondo al deslizar
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.mainPadding.right),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 6,
              borderRadius: Constants.mainBorderRadius,
              child: InkWell(
                onTap: () => PageNavigation.pushNavigator(
                  context,
                  page: Product(
                    productId: _favorite.id,
                  ),
                ),
                child: Padding(
                  padding: Constants.mainPadding / 2,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: Constants.mainBorderRadius / 2,
                        child: CachedNetworkImage(
                          imageUrl: _favorite.baseImages[0],
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Constants.mainPadding.left,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  _favorite.name.capitalize(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                formatPrice(_favorite.basePrice),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
