import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({
    required IconData icon,
    VoidCallback? onTap,
    Color backgroundColor = Constants.secondaryColor,
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
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter: Constants.iamgeFilterBlur,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: _onTap,
            child: Padding(
              padding: Constants.buttonPadding,
              child: Icon(
                _iconData,
                color: _iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
