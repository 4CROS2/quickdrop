import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  SnackBarAction? snackBarAction,
}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message.capitalize(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        actionOverflowThreshold: 0.75,
        action: snackBarAction,
      ),
    );
}
