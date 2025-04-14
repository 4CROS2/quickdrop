import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    required String imageUrl,
    BoxFit boxFit = BoxFit.cover,
    super.key,
  })  : _imageUrl = imageUrl,
        _boxFit = boxFit;

  final String _imageUrl;
  final BoxFit _boxFit;

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
          Center(
        child: const CircularProgressIndicator.adaptive(),
      ),
      errorWidget: (BuildContext context, String url, Object error) => Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            Icons.error_outline,
          ),
        ),
      ),
      width: double.infinity,
      fit: widget._boxFit,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
