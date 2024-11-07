import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class CarrousellTile extends StatefulWidget {
  const CarrousellTile({
    required List<String> images,
    required int currentPage,
    required int index,
    super.key,
  })  : _index = index,
        _images = images,
        _currentPage = currentPage;

  final int _currentPage;
  final int _index;
  final List<String> _images;

  @override
  State<CarrousellTile> createState() => _CarrousellTileState();
}

class _CarrousellTileState extends State<CarrousellTile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        context.push(
          '/fullScrenImage',
          extra: <String, dynamic>{
            'images': widget._images,
            'currentPage': widget._currentPage
          },
        );
      },
      child: Hero(
        tag: widget._images[widget._index],
        child: ImageLoader(
          imageUrl: widget._images[widget._index],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
