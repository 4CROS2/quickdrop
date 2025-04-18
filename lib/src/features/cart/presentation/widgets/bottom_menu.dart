import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/cart_list_total.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';
import 'package:quickdrop/src/features/cart/presentation/widgets/cart_information.dart';
import 'package:quickdrop/src/features/cart/presentation/widgets/continue_shopping.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    required this.products,
    super.key,
  });

  final List<CartProductEntity> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }
    return PreferredSize(
      preferredSize: const Size(double.infinity, 120),
      child: Material(
        surfaceTintColor: Constants.primaryColor,
        elevation: 5,
        shadowColor: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: Constants.mainPadding,
            child: Column(
              spacing: Constants.mainPaddingValue,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CartInformation(
                  label: 'total',
                  description: formatPrice(
                    products.grandTotalCents(),
                  ),
                ),
                const ContinueShopping()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
