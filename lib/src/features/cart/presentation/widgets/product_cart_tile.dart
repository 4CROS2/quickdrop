import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';

class ProductCartTile extends StatefulWidget {
  const ProductCartTile({
    required this.product,
    super.key,
  });
  final CartProductEntity product;

  @override
  State<ProductCartTile> createState() => _ProductCartTileState();
}

class _ProductCartTileState extends State<ProductCartTile> {
  final double sizeImage = 70.0;
  @override
  Widget build(BuildContext context) {
    final CartProductEntity product = widget.product;
    return Padding(
      padding: Constants.mainPadding,
      child: Material(
        child: Row(
          spacing: Constants.mainPaddingValue / 2,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: Constants.mainBorderRadius,
              child: SizedBox(
                width: sizeImage,
                height: sizeImage,
                child: ImageLoader(
                  imageUrl: product.productImage,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //product name
                  Text(
                    product.name.capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //quantity
                  Text.rich(
                    TextSpan(
                      text: 'cantidad: '.capitalize(),
                      children: <InlineSpan>[
                        TextSpan(
                          text: product.quantity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //price
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      formatPrice(product.total),
                      style: const TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: Constants.mainBorderRadius,
              child: Padding(
                padding: Constants.mainPadding / 4,
                child: const Icon(
                  Icons.more_horiz_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
