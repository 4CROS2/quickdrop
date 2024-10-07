import 'package:flutter/material.dart';

Color getTextColor(Color backgroundColor) {
  double luminance = backgroundColor.computeLuminance();
  // Ajustar el umbral de luminancia y manejar colores específicos
  return luminance > 0.4 || backgroundColor == Colors.black12
      ? Colors.black
      : Colors.white;
}
