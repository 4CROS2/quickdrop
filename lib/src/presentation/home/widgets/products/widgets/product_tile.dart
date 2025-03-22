import 'dart:async';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/home/widgets/products/widgets/favorite/add_favorite.dart';
import 'package:quickdrop/src/presentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    required ProductsEntity product,
    super.key,
  }) : _product = product;
  final ProductsEntity _product;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  late final Size size;

  @override
  void initState() {
    super.initState();
    _getImageSize(
      imageUrl: widget._product.baseImages.first,
    );
  }

  Future<void> _getImageSize({required String imageUrl}) async {
    final Image image = Image.network(imageUrl);
    final ImageStream imageStream =
        image.image.resolve(const ImageConfiguration());
    final Completer<void> completer = Completer<void>();

    imageStream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        final Size size = Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        );
        setState(() {
          this.size = size;
        });
        completer.complete();
      }),
    );

    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding / 2,
      child: Material(
        elevation: 12,
        clipBehavior: Clip.hardEdge,
        borderRadius: Constants.mainBorderRadius,
        shadowColor: Colors.transparent,
        surfaceTintColor: Constants.primaryColor,
        child: InkWell(
          onTap: () {
            context.push(
              Uri(
                path: '/product/${widget._product.id}',
                queryParameters: <String, dynamic>{
                  'previewImage': widget._product.baseImages.first
                },
              ).toString(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                      transitionOnUserGestures: true,
                      tag: widget._product.baseImages.first,
                      child: ClipperRadiusImages(
                        borderRadius: Constants.mainBorderRadius / 2,
                        child: SizedBox(
                          height: size.height * .2,
                          child: ImageLoader(
                            imageUrl: widget._product.baseImages[0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Constants.buttonPadding.top / 2,
                      right: Constants.buttonPadding.right / 2,
                      child: AddToFavoriteButton(
                        productId: widget._product.id,
                      ),
                    )
                  ],
                ),
                // product informations
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //product rating
                    Row(
                      spacing: Constants.mainPaddingValue / 2,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RatingBar.readOnly(
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          initialRating: 4,
                          maxRating: 5,
                          size: 18,
                        ),
                        Text(
                          '(20)',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    //product name
                    Text(
                      widget._product.name.capitalize(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    //product price
                    Text(
                      formatPrice(widget._product.basePrice),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Constants.primaryColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
