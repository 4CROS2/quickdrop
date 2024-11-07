import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/product/widgets/buttons/buy_buttons.dart';
import 'package:quickdrop/src/presentation/product/widgets/vendor/vendor.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    required ProductsEntity product,
    super.key,
  }) : _product = product;

  final ProductsEntity _product;

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
                  _product.name.capitalize(),
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
          const BuyButtons(),
          //vendor data
          const Vendor(),
          //

          //other products
          ...List<Text>.generate(
            100,
            (int index) => Text(
              index.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
