import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/get_text_color.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({
    required IconData icon,
    VoidCallback? onTap,
    super.key,
  })  : _icon = icon,
        _onTap = onTap;
  final IconData _icon;
  final VoidCallback? _onTap;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Material(
        color: Constants.primaryColor,
        child: InkWell(
          onTap: widget._onTap,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: Constants.mainPadding.top * 1.5),
            child: Center(
              child: Icon(
                widget._icon,
                color: getTextColor(Constants.primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
