import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';

class MyPurchasesHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ClipRRect(
      child: Material(
        color: Colors.transparent,
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: BackdropFilter(
                  filter: Constants.imageFilterBlur,
                  blendMode: BlendMode.srcOver,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withValues(alpha: .1),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.borderValue,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Constants.borderValue,
                            ),
                            child: Text(
                              'mis compras'.capitalize(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: HeaderButton.back(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final double size = 100;
  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
