import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({
    required IconData icon,
    required String label,
    Widget? page,
    super.key,
  })  : _iconData = icon,
        _label = label,
        _page = page;

  final IconData _iconData;
  final String _label;
  final Widget? _page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.mainPadding.left,
      ).copyWith(
        top: Constants.mainPadding.top,
      ),
      child: Material(
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        child: InkWell(
          onTap: () {
            PageNavigation.popNavigator(context);
            if (_page != null) {
              PageNavigation.pushNavigator(
                context,
                page: _page,
              );
            }
          },
          child: Padding(
            padding: Constants.mainPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      _iconData,
                      size: 25,
                      color: Constants.primaryColor,
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Constants.mainPadding.left,
                        ),
                        child: Text(
                          _label.toTitleCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
