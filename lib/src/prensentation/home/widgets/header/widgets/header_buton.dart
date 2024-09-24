import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({
    required IconData icon,
    VoidCallback? onTap,
    Color backgroundColor = Colors.black12,
    Color? iconColor,
    super.key,
  })  : _iconData = icon,
        _iconColor = iconColor,
        _onTap = onTap,
        _backgroundColor = backgroundColor;
  final IconData _iconData;
  final VoidCallback? _onTap;
  final Color _backgroundColor;
  final Color? _iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius,
      color: _backgroundColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: _onTap,
        child: Padding(
          padding: Constants.buttonPadding,
          child: Icon(
            _iconData,
            color: _iconColor,
          ),
        ),
      ),
    );
  }
}
