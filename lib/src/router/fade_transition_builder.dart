import 'package:flutter/material.dart';

Widget fadeTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const double begin = 0.0;
  const double end = 1.0;
  const Cubic curve = Curves.easeIn;

  Animatable<double> tween = Tween<double>(begin: begin, end: end).chain(
    CurveTween(
      curve: curve,
    ),
  );

  Animation<double> opacityAnimation = animation.drive(tween);

  return FadeTransition(
    opacity: opacityAnimation,
    child: child,
  );
}
