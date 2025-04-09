import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List?> captureWidget({required GlobalKey globalKey}) async {
  try {
    // Obtén el RenderRepaintBoundary
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return null;
    }

    // Captura la imagen; puedes ajustar el pixelRatio para mayor calidad.
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    // Convierte la imagen a bytes en formato PNG.
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  } catch (e) {
    throw 'error al capturar la imagen';
  }
}
