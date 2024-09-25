import 'package:flutter/material.dart';

class Constants {
  static double borderValue = 14.0;

  ///main border radius
  static BorderRadius mainBorderRadius = BorderRadius.circular(borderValue);

  static OutlineInputBorder authBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: Constants.mainBorderRadius,
  );

  static TextStyle inputsTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'RedHat',
    fontSize: 14,
  );
  static TextStyle errorTextStyle = inputsTextStyle.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );
  static Color primaryColor = const Color(
    0xFF7C96F4,
  );
  static Color secondaryColor = Colors.black12;

  static EdgeInsets mainPadding = const EdgeInsets.all(12);
  static EdgeInsets buttonPadding = const EdgeInsets.all(15);
}
