import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class ClipperRadiusImages extends StatelessWidget {
  const ClipperRadiusImages({
    required Widget child,
    BorderRadius? borderRadius,
    super.key,
  })  : _child = child,
        _borderRadius = borderRadius;
  final Widget _child;
  final BorderRadius? _borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius ??
          BorderRadius.only(
            topLeft: Radius.circular(
              Constants.mainBorderRadius.bottomLeft.x,
            ),
            topRight: Radius.circular(
              Constants.mainBorderRadius.bottomLeft.x,
            ),
          ),
      child: _child,
    );
  }
}
