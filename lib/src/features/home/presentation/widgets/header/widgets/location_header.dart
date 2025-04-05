import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      surfaceTintColor: Constants.secondaryColor,
      elevation: 10,
      shadowColor: Colors.transparent,
      borderRadius: Constants.mainBorderRadius * 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/mylocations'),
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: Constants.mainPaddingValue / 2,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                HugeIcons.strokeRoundedLocation05,
              ),
              Flexible(
                child: Text(
                  'cr 4 #76-22'.capitalize(),
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
