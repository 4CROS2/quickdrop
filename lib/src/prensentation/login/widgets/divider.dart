import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Line(),
        CircleDivider(),
        Line(),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius,
      child: const SizedBox(
        height: 3,
        width: 52,
      ),
    );
  }
}

class CircleDivider extends StatelessWidget {
  const CircleDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const double circleSize = 20;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          borderRadius: Constants.mainBorderRadius,
        ),
      ),
    );
  }
}
