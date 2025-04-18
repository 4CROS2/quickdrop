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
  static const Color primaryColor = Color(0xFF8d45d5);
  static const Color secondaryColor = Color(0xFFe6f1cc);
  //Color(0x71FFFFFF); /*  Color.fromRGBO(56, 56, 56, 0.603) */

  static EdgeInsets mainPadding = EdgeInsets.all(mainPaddingValue);
  static EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: mainPaddingValue,
    vertical: mainPaddingValue,
  );

  static Duration animationTransition = const Duration(milliseconds: 400);

  static EdgeInsets paddingTop = EdgeInsets.only(
    top: Constants.mainPadding.top,
  );

  static ImageFilter imageFilterBlur = ImageFilter.blur(
    sigmaX: 5,
    sigmaY: 5,
  );

  static BorderRadius insetBorderRadius =
      BorderRadius.circular(borderValue - mainPaddingValue);

  static EdgeInsets mainPaddingSymetricHorizontal = EdgeInsets.symmetric(
    horizontal: mainPaddingValue,
  );

  static EdgeInsets mainPaddingSymetricVertical = EdgeInsets.symmetric(
    vertical: mainPaddingValue,
  );
  static TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: 'Questrial',
  );
  static PageTransitionsTheme pageTransition = PageTransitionsTheme(
    builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
      TargetPlatform.values,
      value: (_) => const FadeForwardsPageTransitionsBuilder(),
    ),
  );
}
