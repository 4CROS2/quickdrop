import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/payment_section.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    required PurchaseEntity product,
    super.key,
  }) : _product = product;
  final PurchaseEntity _product;

  int get quantity => _product.quantity;
  int get price => _product.currentPrice;

  @override
  Widget build(BuildContext context) {
    return PaymentSection(
      title: 'datos de compra',
      child: Material(
        borderRadius: Constants.mainBorderRadius / 2,
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Constants.mainPaddingValue / 2,
                children: <Widget>[
                  _productInformation(
                    label: 'producto',
                    data: _product.productName,
                  ),
                  _productInformation(
                    label: 'cantidad',
                    data: _product.quantity.toString(),
                  ),
                  _productInformation(
                    label: 'precio',
                    data: formatPrice(
                      _product.currentPrice,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: Constants.mainBorderRadius / 4,
                  child: ImageLoader(
                    imageUrl: _product.imagePath,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _productInformation({required String label, required String data}) {
    return Text.rich(
      TextSpan(
        text: '$label: '.capitalize(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: data.toTitleCase(),
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
