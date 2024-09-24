import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/prensentation/home/widgets/header/widgets/header_buton.dart';
import 'package:quickdrop/src/prensentation/product/widgets/title_header.dart';
import 'package:quickdrop/src/prensentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/prensentation/widgets/image_loader.dart';

class ProductHeader extends SliverPersistentHeaderDelegate {
  ProductHeader({
    required String heroTag,
    required String productImg,
    required String title,
  })  : _heroTag = heroTag,
        _productImg = productImg,
        _title = title;

  final String _heroTag;
  final String _productImg;
  final String _title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / (maxExtent - minExtent);
    final double opacity =
        ((percent <= 0.4) ? 0.0 : (percent - 0.4) * 2).clamp(0.0, 1.0);
    return Material(
      color: Colors.black12,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            transitionOnUserGestures: true,
            tag: _heroTag,
            child: ClipperRadiusImages(
              child: ImageLoader(
                imageUrl: _productImg,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: opacity,
              child: SizedBox(
                height: minExtent,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding.right,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        HeaderButtons(
                          onTap: () => PageNavigation.popNavigator(context),
                          icon: Icons.arrow_back_ios_new_rounded,
                          backgroundColor: Colors.black45,
                          iconColor: Colors.white,
                        ),
                        TitleHeader(
                          title: _title,
                          showText: percent >= 1.1,
                        ),
                      ],
                    ),
                    const HeaderButtons(
                      icon: Icons.shopping_cart_outlined,
                      backgroundColor: Colors.black45,
                      iconColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  final double maxExtent = 340;
  @override
  double minExtent = 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
