import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AppLightTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('AppTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createLightTheme(context);
  }

  static ThemeData _createLightTheme(BuildContext context) {
    return ThemeData(
      pageTransitionsTheme: Constants.pageTransition,
      colorSchemeSeed: Constants.primaryColor,
      fontFamily: 'Questrial',
      progressIndicatorTheme: ProgressIndicatorThemeData(
        // ignore: deprecated_member_use
        year2023: false,
        color: Constants.primaryColor,

        linearTrackColor: Constants.secondaryColor,
      ),
      cardColor: Colors.black.withValues(alpha: .1),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: Constants.primaryColor,
        titleTextStyle: Constants.titleStyle.copyWith(
          color: Constants.primaryColor,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => TextStyle(
            fontSize: 12,
            fontFamily: 'Albertsans',
            shadows: <Shadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 12,
                blurStyle: BlurStyle.inner,
                spreadRadius: 10,
              )
            ],
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w900
                : FontWeight.w300,
          ),
        ),
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
}
