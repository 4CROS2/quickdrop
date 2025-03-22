import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
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
      color: Colors.black12,
      borderRadius: Constants.mainBorderRadius * 2,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: Constants.mainPaddingValue / 2,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.location_on_rounded),
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
