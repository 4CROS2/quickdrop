import 'package:flutter/material.dart';

class Constants {
  ///main border radius
  static BorderRadius mainBorderRadius = BorderRadius.circular(14);

  static OutlineInputBorder authBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: Constants.mainBorderRadius,
  );

  static TextStyle inputsTextStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontFamily: 'RedHat');

  static Color primaryColor = const Color(
    0xFF7C96F4,
  );
}
