import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/prensentation/product/widgets/quantity/widgets/quantity_button.dart';
import 'package:quickdrop/src/prensentation/product/widgets/quantity/widgets/quantity_text_field.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key});

  @override
  State<Quantity> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<Quantity> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Constants.mainBorderRadius,
      child: Material(
        color: Constants.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            QuantityButton(
              onTap: () {},
              icon: Icons.remove,
            ),
            QuantityTextField(controller: _controller),
            QuantityButton(
              onTap: () {},
              icon: Icons.add,
            )
          ],
        ),
      ),
    );
  }
}
