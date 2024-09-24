import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/prensentation/product/product.dart';
import 'package:quickdrop/src/prensentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/prensentation/widgets/image_loader.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required int index,
    super.key,
  }) : _index = index;
  final int _index;

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
                index: _index.toString(),
                productImg: 'https://i.redd.it/g4crddfnmt9a1.jpg',
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: _index.toString(),
                child: const ClipperRadiusImages(
                  child: ImageLoader(
                      imageUrl: 'https://i.redd.it/g4crddfnmt9a1.jpg'),
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
                      'asahdjkahfjfkafhdh'.capitalize(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    //product price
                    Text(
                      formatPrice(13220),
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
