import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/presentation/widgets/header_buton.dart';
import 'package:quickdrop/src/presentation/home/widgets/header/widgets/location_header.dart';
import 'package:quickdrop/src/presentation/home/widgets/header/widgets/search_input.dart';
import 'package:quickdrop/src/presentation/search/search.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  HomeHeader();
  final double maxExtentHeader = 165.0;
  final double minExtentHeader = 101.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double speedMultiplier = 3;
    final double percent = Curves.easeIn.transform(
        (shrinkOffset / (maxExtentHeader - minExtentHeader) * speedMultiplier)
            .clamp(0.0, 1.0));
    final double originalSize = MediaQuery.sizeOf(context).width * .16;
    return Material(
      color: Color.lerp(
        Theme.of(context).scaffoldBackgroundColor,
        Constants.primaryColor,
        percent,
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: Constants.mainPadding.copyWith(
              top: 0,
              bottom: 10,
            ),
            child: Stack(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HeaderButtons(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icons.menu_rounded,
                    ),
                    LocationHeader(
                      opacity: 1 - percent,
                    ),
                    const HeaderButtons(
                      icon: Icons.shopping_cart_outlined,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0 + (originalSize * percent),
                  right: 0 + (originalSize * percent),
                  child: Hero(
                    tag: 'search',
                    transitionOnUserGestures: true,
                    child: SearchInput(
                      disabled: true,
                      onTap: () {
                        PageNavigation.pushNavigator(
                          context,
                          page: const Search(),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxExtentHeader;

  @override
  double get minExtent => minExtentHeader;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
