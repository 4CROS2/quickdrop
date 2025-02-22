import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/widgets/header_buton.dart';

class PurchaseDetailAppbar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / maxExtent;

    return SizedBox(
      width: double.infinity,
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          // Fondo con efecto de desenfoque
          Positioned.fill(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20 * percent,
                  sigmaY: 20 * percent,
                ),
                child: Material(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          // Contenido del AppBar
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: minExtent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.mainPaddingValue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HeaderButton(
                      onTap: () => context.pop(),
                      icon: Icons.arrow_back_ios_new_rounded,
                    ),
                    HeaderButton(
                      onTap: () {
                        showCupertinoSheet(
                          context: context,
                          useNestedNavigation: true,
                          pageBuilder: (BuildContext context) {
                            return Scaffold();
                          },
                        );
                      },
                      icon: Icons.qr_code_2_rounded,
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
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
