import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/presentation/product/widgets/buttons/buy_buttons.dart';
import 'package:quickdrop/src/presentation/product/widgets/relatedProducts/related_product.dart';
import 'package:quickdrop/src/presentation/product/widgets/tags/tags.dart';
import 'package:quickdrop/src/presentation/product/widgets/vendor/seller.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    required ProductDetailEntity product,
    super.key,
  }) : _product = product;

  final ProductDetailEntity _product;

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
                  _product.productName.capitalize(),
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
                    formatPrice(_product.basePrice),
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
            padding: EdgeInsets.only(top: Constants.mainPadding.top),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.12),
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _product.description.capitalizeSentences(),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //tags
          Tags(tags: _product.tags),

          const BuyButtons(),
          //vendor data
          Seller(
            sellerData: _product.sellerData,
          ),
          //related products
          if (_product.relatedProducts.isNotEmpty)
            RelatedProducts(
              relatedProduct: _product.relatedProducts,
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
