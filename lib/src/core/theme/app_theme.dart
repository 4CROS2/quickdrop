import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AppTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('AppTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context, {bool isDarkMode = false}) {
    _instance =
        isDarkMode ? _createDarkTheme(context) : _createLightTheme(context);
  }

  static PageTransitionsTheme get _pageTransition => PageTransitionsTheme(
        builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
          TargetPlatform.values,
          value: (_) => FadeForwardsPageTransitionsBuilder(),
        ),
      );

  static ThemeData _createLightTheme(BuildContext context) {
    return ThemeData(
      pageTransitionsTheme: _pageTransition,
      colorSchemeSeed: Constants.primaryColor,
      fontFamily: 'Questrial',
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        // ignore: deprecated_member_use
        year2023: false,
        color: Constants.primaryColor,
        linearTrackColor: Constants.secondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Constants.primaryColor.withValues(
          alpha: .2,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: Constants.mainBorderRadius,
          gapPadding: Constants.mainPaddingValue * 2,
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }

  static ThemeData _createDarkTheme(BuildContext context) {
    return ThemeData(
      pageTransitionsTheme: _pageTransition,
      colorSchemeSeed: Constants.primaryColor,
      fontFamily: 'Questrial',
      brightness: Brightness.dark,
    );
  }
}
