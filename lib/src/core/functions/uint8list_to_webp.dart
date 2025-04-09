import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List> convertToWebP(Uint8List imageBytes) async {
  final Uint8List compressedBytes = await FlutterImageCompress.compressWithList(
    imageBytes,
    format: CompressFormat.webp,
    quality: 80,
  );

  return Uint8List.fromList(compressedBytes);
}
