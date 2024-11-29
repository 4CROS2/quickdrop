import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class Tags extends StatelessWidget {
  Tags({
    required List<String> tags,
    super.key,
  }) : _tags = tags;
  final List<String> _tags;
  final double spacing = (Constants.mainPadding / 2).top;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Constants.mainPadding.top),
      child: Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: _tags
            .map(
              (String tag) => Material(
                color: Constants.primaryColor.withOpacity(.15),
                borderRadius: Constants.mainBorderRadius,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.mainPadding.top / 2,
                      horizontal: Constants.mainPadding.top,
                    ),
                    child: Text(
                      '#${tag.capitalize()}',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
