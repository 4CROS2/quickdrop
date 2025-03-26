import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';

class SearchHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: Constants.mainPaddingSymetricHorizontal,
            child: Row(
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                HeaderButton.back(context),
                Flexible(
                  child: Hero(
                    tag: 'search',
                    child: Material(
                      color: Colors.transparent,
                      child: TextFormField(
                        ignorePointers: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Buscar productos',
                          prefixIcon: const Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                            borderRadius: Constants.mainBorderRadius,
                            gapPadding: Constants.mainPaddingValue * 2,
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Constants.secondaryColor,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => Constants.minHeight;

  @override
  double get minExtent => Constants.minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
