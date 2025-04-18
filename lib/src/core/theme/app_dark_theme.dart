import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AppDarkTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('AppTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createDarkTheme(context);
  }

  static ThemeData _createDarkTheme(BuildContext context) {
    return ThemeData(
      pageTransitionsTheme: Constants.pageTransition,
      colorSchemeSeed: Constants.primaryColor,
      fontFamily: 'Questrial',
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: Constants.primaryColor,
        titleTextStyle: Constants.titleStyle,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        surfaceTintColor: ThemeData.dark().scaffoldBackgroundColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => TextStyle(
            fontSize: 10,
            fontFamily: 'Albertsans',
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w900
                : FontWeight.w300,
          ),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        // ignore: deprecated_member_use
        year2023: false,
        color: Constants.primaryColor,
        linearTrackColor: Constants.secondaryColor,
      ),
      cardColor: Colors.grey.shade900,
    );
  }
}
