import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class FullScreenImage extends StatefulWidget {
  const FullScreenImage({
    required List<String> images,
    required int currentPage,
    super.key,
  })  : _images = images,
        _currentPage = currentPage;
  final List<String> _images;
  final int _currentPage;

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late final PageController _controller;
  late TransformationController _transformationController;
  late final TapGestureRecognizer _tapRecognizer;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget._currentPage,
    );
    _transformationController = TransformationController();
    _tapRecognizer = TapGestureRecognizer();
    _tapRecognizer.onSecondaryTap = onDoubleTap;
  }

  void onDoubleTap() {
    setState(() {
      if (scale == 1.0) {
        scale = 1.5; // Zoom in (puedes ajustar este valor)
      } else {
        scale = 1.0; // Zoom out
      }
      // Aplicar la transformación de escala al TransformationController
      _transformationController.value = Matrix4.identity()..scale(scale);
    });
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    _transformationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: ClipRRect(
            child: BackdropFilter(
              filter: Constants.iamgeFilterBlur,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onDoubleTap: onDoubleTap,
          child: PageView.builder(
            controller: _controller,
            physics: Constants.bouncingScrollPhysics,
            itemCount: widget._images.length,
            itemBuilder: (BuildContext context, int index) => Material(
              color: Colors.transparent,
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: Hero(
                    tag: widget._images[index],
                    child: ImageLoader(
                      imageUrl: widget._images[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 12,
          child: Material(
            color: Colors.black45,
            borderRadius: Constants.mainBorderRadius,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                context.pop(true);
              },
              child: Padding(
                padding: Constants.buttonPadding,
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
