import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/prensentation/widgets/header_buton.dart';

class FavoriteHeader extends SliverPersistentHeaderDelegate {
  FavoriteHeader();
  final double height = Constants.minHeight;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter: Constants.iamgeFilterBlur,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.mainPadding.left,
              ),
              child: Row(
                children: <Widget>[
                  HeaderButtons(
                    onTap: () => PageNavigation.popNavigator(context),
                    icon: Icons.arrow_back_ios_rounded,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}