import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class CarrousellIndicator extends StatefulWidget {
  const CarrousellIndicator(
      {required int imagesLength, required int currentPage, super.key})
      : _imagesLength = imagesLength,
        _currentPage = currentPage;
  final int _imagesLength;
  final int _currentPage;

  @override
  State<CarrousellIndicator> createState() => _CarrousellIndicatorState();
}

class _CarrousellIndicatorState extends State<CarrousellIndicator> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: Constants.mainBorderRadius,
        child: Stack(
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
            Padding(
              padding: Constants.mainPadding / 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ...List<Widget>.generate(
                    widget._imagesLength,
                    (int index) => AnimatedContainer(
                      duration: Constants.animationTransition,
                      width: widget._currentPage == index ? 30 : 10,
                      height: 10,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : Constants.mainPadding.left / 2,
                      ),
                      decoration: BoxDecoration(
                        color: widget._currentPage == index
                            ? Colors.white
                            : Constants.secondaryColor,
                        borderRadius: Constants.mainBorderRadius,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
