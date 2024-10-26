import 'package:flutter/material.dart';

Widget slideTransitionBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const Offset begin = Offset(1.0, 0.0); // Deslizar desde la derecha
  const Offset end = Offset.zero;
  const Cubic curve = Curves.easeInOut;

  Animatable<Offset> tween =
      Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
  Animation<Offset> offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
