import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  HeaderButtons(
                    onTap: () => context.pop(),
                    icon: Icons.arrow_back_ios_rounded,
                    iconColor: Colors.white,
                  ),
                  Text(
                    'tus favoritos'.capitalize(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
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
