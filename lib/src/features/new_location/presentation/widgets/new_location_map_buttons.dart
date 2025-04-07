import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class NewLocationMapButton extends StatefulWidget {
  const NewLocationMapButton({
    required this.icon,
    this.onTap,
    super.key,
  });
  final IconData icon;
  final VoidCallback? onTap;

  @override
  State<NewLocationMapButton> createState() => _NewLocationMapButtonState();
}

class _NewLocationMapButtonState extends State<NewLocationMapButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      elevation: 5,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Constants.primaryColor,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: Constants.mainPadding,
          child: AnimatedSwitcher(
            duration: Constants.animationTransition * .8,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Icon(
              key: Key(widget.icon.toString()),
              widget.icon,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
