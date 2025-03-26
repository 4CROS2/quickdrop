import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class SwitchTransition extends StatelessWidget {
  const SwitchTransition({
    required Widget child,
    super.key,
  }) : _child = child;
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Constants.animationTransition,
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: _child,
    );
  }
}
