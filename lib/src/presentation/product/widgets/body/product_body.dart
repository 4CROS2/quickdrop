import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/presentation/product/widgets/buttons/buy_buttons.dart';
import 'package:quickdrop/src/presentation/product/widgets/relatedProducts/related_product.dart';
import 'package:quickdrop/src/presentation/product/widgets/tags/tags.dart';
import 'package:quickdrop/src/presentation/product/widgets/vendor/seller.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({
    required ProductDetailEntity product,
    super.key,
  }) : _product = product;

  final ProductDetailEntity _product;

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //product name
              Flexible(
                child: Text(
                  widget._product.productName.capitalize(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              //product price
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: Constants.mainBorderRadius,
                ),
                child: Padding(
                  padding: Constants.mainPadding,
                  child: Text(
                    formatPrice(widget._product.basePrice),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
              top: Constants.mainPadding.top,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .12),
                borderRadius: Constants.mainBorderRadius,
              ),
              child: Padding(
                padding: Constants.mainPadding.copyWith(
                  bottom: Constants.mainPadding.top,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'descripción'.capitalize(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget._product.description.capitalizeSentences(),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //tags
          Tags(tags: widget._product.tags),

          BuyButtons(
            productId: widget._product.productId,
          ),
          //vendor data
          Seller(
            sellerData: widget._product.sellerData,
          ),
          //related products
          if (widget._product.relatedProducts.isNotEmpty)
            RelatedProducts(
              relatedProduct: widget._product.relatedProducts,
            ),
          //other products
          /* ...List<Text>.generate(
            100,
            (int index) => Text(
              index.toString(),
            ),
          ), */
        ],
      ),
    );
  }
}
