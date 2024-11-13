import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/widgets/drop_shadow_widget.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({
    required List<ProductsEntity> relatedProduct,
    super.key,
  }) : _relatedProduct = relatedProduct;

  final List<ProductsEntity> _relatedProduct;
  final double _height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Productos relacionados',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: Constants.paddingTop,
            child: SizedBox(
              height: _height,
              child: ListView.builder(
                physics: Constants.bouncingScrollPhysics,
                scrollDirection: Axis.horizontal,
                itemCount: _relatedProduct.length,
                itemBuilder: (BuildContext context, int index) => Material(
                  elevation: 1,
                  borderRadius: Constants.mainBorderRadius,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      context.push(
                        Uri(
                          path: '/product/${_relatedProduct[index].id}',
                          queryParameters: <String, dynamic>{
                            'previewImage':
                                _relatedProduct[index].baseImages.first
                          },
                        ).toString(),
                      );
                    },
                    enableFeedback: true,
                    child: SizedBox(
                      width: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            DropShadowWidget(
                              scale: .95,
                              borderRadius: BorderRadius.circular(
                                Constants.mainBorderRadius.topLeft.x / 2,
                              ),
                              image: SizedBox(
                                height: 110,
                                child: ImageLoader(
                                  imageUrl:
                                      _relatedProduct[index].baseImages[0],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: Constants.paddingTop / 2,
                                child: Text(
                                  _relatedProduct[index].name.capitalize(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    height: .9,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                formatPrice(
                                  _relatedProduct[index].basePrice,
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w900,
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
          ),
        ],
      ),
    );
  }
}
