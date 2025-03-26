import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/widgets/clipper_radius_images.dart';

class DropShadowWidget extends StatelessWidget {
  const DropShadowWidget({
    required this.child,
    super.key,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
    this.scale = 1.0,
    this.offset = const Offset(4.0, 4.0),
  });
  final double scale;
  final Offset offset;
  final BorderRadius borderRadius;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      key: key,
      children: <Widget>[
        Transform.translate(
          offset: offset,
          child: Transform.scale(
            scale: scale,
            child: ClipperRadiusImages(
              borderRadius: Constants.mainBorderRadius,
              child: child,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: BackdropFilter(
              filter: Constants.imageFilterBlur,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        ClipperRadiusImages(
          borderRadius: borderRadius,
          child: child,
        )
      ],
    );
  }
}
