import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({required String imageUrl, super.key})
      : _imageUrl = imageUrl;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      progressIndicatorBuilder: (
        BuildContext context,
        String url,
        DownloadProgress progress,
      ) =>
          const CupertinoActivityIndicator.partiallyRevealed(),
      errorWidget: (BuildContext context, String url, Object error) =>
          const Center(
        child: Icon(
          Icons.error_outline,
        ),
      ),
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
