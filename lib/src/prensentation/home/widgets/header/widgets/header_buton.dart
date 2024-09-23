import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class HeaderButtons extends StatefulWidget {
  const HeaderButtons({
    required IconData icon,
    VoidCallback? onTap,
    super.key,
  })  : _iconData = icon,
        _onTap = onTap;
  final IconData _iconData;
  final VoidCallback? _onTap;
  @override
  State<HeaderButtons> createState() => _HeaderButtonsState();
}

class _HeaderButtonsState extends State<HeaderButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget._onTap,
      child: Material(
        borderRadius: Constants.mainBorderRadius,
        color: Colors.black12,
        child: Padding(
          padding: Constants.buttonPadding,
          child: Icon(widget._iconData),
        ),
      ),
    );
  }
}
