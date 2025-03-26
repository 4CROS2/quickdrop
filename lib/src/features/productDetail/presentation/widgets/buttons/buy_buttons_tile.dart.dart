import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/get_text_color.dart';

class BuyButtonTile extends StatefulWidget {
  const BuyButtonTile({
    required String label,
    required IconData prefixIcon,
    VoidCallback? onTap,
    Color backgroundColor = Colors.black12,
    super.key,
  })  : _prefixIcon = prefixIcon,
        _label = label,
        _onTap = onTap,
        _backgroundColor = backgroundColor;

  final VoidCallback? _onTap;
  final String _label;
  final Color _backgroundColor;
  final IconData _prefixIcon;
  @override
  State<BuyButtonTile> createState() => _BuyButtonTileState();
}

class _BuyButtonTileState extends State<BuyButtonTile> {
  late final Color _elementColor;
  @override
  void initState() {
    super.initState();
    _elementColor = getTextColor(widget._backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget._backgroundColor,
      clipBehavior: Clip.hardEdge,
      borderRadius: Constants.mainBorderRadius,
      child: InkWell(
        onTap: widget._onTap,
        child: Padding(
          padding: Constants.mainPadding * 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                widget._prefixIcon,
                color: _elementColor,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Constants.mainPadding.left,
                  ),
                  child: Text(
                    widget._label.capitalize(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _elementColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
