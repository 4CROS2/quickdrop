import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class ContinueShopping extends StatelessWidget {
  const ContinueShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: Constants.mainBorderRadius,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: Padding(
            padding: Constants.mainPaddingSymetricVertical * 1.5,
            child: const Text(
              'Continuar compra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
