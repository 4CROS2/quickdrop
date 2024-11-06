import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  const ImageLoader({required String imageUrl, super.key})
      : _imageUrl = imageUrl;
  final String _imageUrl;

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CachedNetworkImage(
      imageUrl: widget._imageUrl,
      progressIndicatorBuilder: (
        BuildContext context,
        String url,
        DownloadProgress progress,
      ) =>
          const CupertinoActivityIndicator(),
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

  @override
  bool get wantKeepAlive => true;
}
