import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';

class LocationHeader extends StatefulWidget {
  const LocationHeader({
    double opacity = 1,
    super.key,
  }) : _opacity = opacity;
  final double _opacity;
  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget._opacity,
      child: Material(
        color: Colors.black12,
        borderRadius: Constants.mainBorderRadius * 2,
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(Icons.location_on_rounded),
              Text(
                'cr 4 #76-22'.capitalize(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
