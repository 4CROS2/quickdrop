import 'package:flutter/material.dart';

Widget slideTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  // Deslizar desde la derecha
  const Offset begin = Offset(1.0, 0.0); // Comienza a la derecha
  const Offset end = Offset.zero; // Termina en el centro
  const Cubic curve = Curves.easeInOut; // Curva suave

  // Definimos el Tween para el desplazamiento
  Animatable<Offset> tween =
      Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
  Animation<Offset> offsetAnimation = animation.drive(tween);

  // Para el efecto de desvanecimiento
  Animation<double> fadeAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );

  return SlideTransition(
    position: offsetAnimation,
    child: FadeTransition(
      opacity: fadeAnimation,
      child: child,
    ),
  );
}
