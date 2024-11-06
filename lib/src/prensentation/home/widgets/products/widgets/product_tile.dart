import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/prensentation/home/widgets/products/widgets/favorite/add_favorite.dart';
import 'package:quickdrop/src/prensentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/prensentation/widgets/image_loader.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required ProductsEntity product,
    super.key,
  }) : _product = product;
  final ProductsEntity _product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding / 2,
      child: Material(
        elevation: 2,
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
        borderRadius: Constants.mainBorderRadius,
        child: InkWell(
          onTap: () {
            /* PageNavigation.pushNavigator(
              context,
              page: Product(
                productId: _product.id,
              ),
            ); */
            context.push(
              Uri(
                path: '/product/${_product.id}',
                queryParameters: <String, dynamic>{
                  'previewImage': _product.baseImages.first
                },
              ).toString(),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    transitionOnUserGestures: true,
                    tag: _product.id,
                    child: ClipperRadiusImages(
                      child: ImageLoader(
                        imageUrl: _product.baseImages[0],
                      ),
                    ),
                  ),
                  Positioned(
                    top: Constants.buttonPadding.top / 2,
                    right: Constants.buttonPadding.right / 2,
                    child: AddToFavoriteButton(
                      productId: _product.id,
                    ),
                  )
                ],
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
                      formatPrice(_product.basePrice),
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
