import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/home_products.dart';
import 'package:quickdrop/src/prensentation/product/product.dart';
import 'package:quickdrop/src/prensentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/prensentation/widgets/image_loader.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required HomeProductsEntity product,
    super.key,
  }) : _product = product;
  final HomeProductsEntity _product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding / 2,
      child: Material(
        elevation: 5,
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
        borderRadius: Constants.mainBorderRadius,
        child: InkWell(
          onTap: () {
            PageNavigation.pushNavigator(
              context,
              page: Product(
                index: _product.id,
                productImg: _product.images[0],
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: _product.id,
                child: ClipperRadiusImages(
                  child: ImageLoader(
                    imageUrl: _product.images[0],
                  ),
                ),
              ),
              // product informations
              Padding(
                padding: Constants.mainPadding.copyWith(
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //product name
                    Text(
                      _product.name.capitalize(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    //product price
                    Text(
                      formatPrice(_product.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
