import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class PopUpLoadingStatus extends StatelessWidget {
  const PopUpLoadingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: Constants.mainBorderRadius,
        child: Padding(
          padding: Constants.mainPadding,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
