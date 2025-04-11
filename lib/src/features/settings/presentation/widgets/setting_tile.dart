import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.sectionTitle,
    this.child = const SizedBox.shrink(),
    super.key,
  });
  final String sectionTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding.copyWith(
        top: Constants.mainPaddingValue,
        bottom: 0,
      ),
      child: Padding(
        padding: Constants.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Constants.mainPaddingValue,
          children: <Widget>[
            Text(
              sectionTitle.capitalize(),
              style: Constants.titleStyle,
            ),
            child
          ],
        ),
      ),
    );
  }
}
