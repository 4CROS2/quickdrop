import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({
    required IconData icon,
    required String label,
    String? page,
    super.key,
  })  : _iconData = icon,
        _label = label,
        _page = page;

  final IconData _iconData;
  final String _label;
  final String? _page;

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
            context.pop();
            if (_page != null) {
              context.push(_page);
            }
          },
          child: Padding(
            padding: Constants.mainPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Row(
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
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
