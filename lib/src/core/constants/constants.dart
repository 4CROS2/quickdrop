import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static double borderValue = 14.0;
  static double minHeight = 110.0;
  static double mainPaddingValue = 12.0;

  ///main border radius
  static BorderRadius mainBorderRadius = BorderRadius.circular(borderValue);

  static const AlwaysScrollableScrollPhysics bouncingScrollPhysics =
      AlwaysScrollableScrollPhysics(
    parent: BouncingScrollPhysics(),
  );

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
  static const Color primaryColor = Color(0xFFE53935);
  static const Color secondaryColor = Color(0xFFFFB300);
  //Color(0x71FFFFFF); /*  Color.fromRGBO(56, 56, 56, 0.603) */

  static EdgeInsets mainPadding = EdgeInsets.all(mainPaddingValue);
  static EdgeInsets buttonPadding = const EdgeInsets.all(13);

  static Duration animationTransition = const Duration(milliseconds: 400);

  static EdgeInsets paddingTop = EdgeInsets.only(
    top: Constants.mainPadding.top,
  );

  static ImageFilter imageFilterBlur = ImageFilter.blur(
    sigmaX: 20,
    sigmaY: 20,
  );

  static BorderRadius insetBorderRadius =
      BorderRadius.circular(borderValue - mainPaddingValue);

  static EdgeInsets mainPaddingSymetricHorizontal = EdgeInsets.symmetric(
    horizontal: mainPaddingValue,
  );
}
