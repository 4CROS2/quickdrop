import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class LocationHeader extends StatefulWidget {
  const LocationHeader({
    super.key,
  });

  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.secondaryColor,
      borderRadius: Constants.mainBorderRadius * 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: Constants.mainPaddingValue / 2,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HugeIcon(
                icon: HugeIcons.strokeRoundedLocation05,
                color: Theme.of(context).iconTheme.color!,
              ),
              Flexible(
                child: Text(
                  'cr 4 #76-22'.capitalize(),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
