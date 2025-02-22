import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class TimelinePainter extends CustomPainter {
  final List<double> dotYPositions; // Lista de posiciones y para los puntos

  TimelinePainter({required this.dotYPositions});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Constants.primaryColor // Color azul claro como en la imagen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap =
          StrokeCap.round; // Terminaciones redondeadas para las líneas

    final double center = size.width / 2;
    double gapBeforeDot =
        Constants.mainPaddingValue / 2; // Separación antes de cada punto
    double gapAfterDot =
        Constants.mainPaddingValue / 2; // Separación después de cada punto

    if (dotYPositions.isNotEmpty) {
      // Dibujar los puntos (círculos) en las posiciones de dotYPositions
      for (double y in dotYPositions) {
        canvas.drawCircle(
          Offset(center, y),
          5, // Tamaño del punto (círculo)
          Paint()..color = Constants.primaryColor, // Color azul claro
        );
      }

      // Dibujar líneas continuas entre los puntos, con separaciones antes y después de cada punto
      for (int i = 0; i < dotYPositions.length - 1; i++) {
        double startY = dotYPositions[i];
        double endY = dotYPositions[i + 1];

        // Ajustar el inicio y fin de la línea para dejar espacios antes y después de los puntos
        double lineStartY = startY +
            5 +
            gapAfterDot; // Comenzar después del punto y la separación posterior
        double lineEndY = endY -
            5 -
            gapBeforeDot; // Terminar antes del siguiente punto y su separación anterior

        // Dibujar una línea continua entre los puntos, respetando las separaciones
        if (lineEndY > lineStartY) {
          canvas.drawLine(
            Offset(center, lineStartY),
            Offset(center, lineEndY),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
