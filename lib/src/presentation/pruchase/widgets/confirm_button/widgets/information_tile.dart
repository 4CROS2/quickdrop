import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({
    required String label,
    required int data,
    super.key,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
  })  : _data = data,
        _label = label,
        _fontSize = fontSize,
        _fontWeight = fontWeight;

  final String _label;
  final int _data;
  final double _fontSize;
  final FontWeight _fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          _label.capitalize(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _fontSize,
          ),
        ),
        Text(
          formatPrice(_data),
          style: TextStyle(
            fontWeight: _fontWeight,
            fontSize: _fontSize,
          ),
        ),
      ],
    );
  }
}
