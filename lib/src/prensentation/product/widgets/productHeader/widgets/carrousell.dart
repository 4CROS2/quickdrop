import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/prensentation/product/widgets/productHeader/widgets/carrousell_indicator.dart';
import 'package:quickdrop/src/prensentation/product/widgets/productHeader/widgets/carrousell_tile.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    required List<String> images,
    super.key,
  }) : _images = images;

  final List<String> _images;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  void onPageChanged({required int page}) {
    if (page != currentPage) {
      setState(() {
        currentPage = page;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _controller,
          onPageChanged: (int value) => onPageChanged(page: value),
          physics: Constants.bouncingScrollPhysics,
          itemCount: widget._images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => CarrousellTile(
            index: index,
            currentPage: currentPage,
            images: widget._images,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: CarrousellIndicator(
            imagesLength: widget._images.length,
            currentPage: currentPage,
          ),
        ),
      ],
    );
  }
}
