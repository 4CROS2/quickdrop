import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class EmptyPurchases extends StatelessWidget {
  const EmptyPurchases({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Constants.mainPadding * 2,
        child: Material(
          elevation: 5,
          borderRadius: Constants.mainBorderRadius,
          surfaceTintColor: Constants.primaryColor,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: Constants.mainPadding * 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 60,
                  color: Color.fromARGB(155, 0, 204, 255),
                ),
                Text(
                  'wow, aún no has realizado ninguna compra'.capitalize(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
