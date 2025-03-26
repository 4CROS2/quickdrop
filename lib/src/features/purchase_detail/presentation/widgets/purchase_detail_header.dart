import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
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
                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Center(
                              child: SizedBox(
                                width: 140,
                                height: 140,
                                child: Material(
                                  borderRadius: Constants.mainBorderRadius,
                                  child: Padding(
                                    padding: Constants.mainPadding,
                                    child: PrettyQrView.data(
                                      data:
                                          'el codigo qr primigenio de la vida en la tierra',
                                      decoration: const PrettyQrDecoration(
                                        shape: PrettyQrSmoothSymbol(
                                          color: Colors.black,
                                          roundFactor: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
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
