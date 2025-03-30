import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required IconData icon,
    this.onTap,
    this.backgroundColor = Constants.secondaryColor,
    this.iconColor,
    super.key,
  }) : _iconData = icon;

  HeaderButton.back(
    BuildContext context, {
    Color backgroundColor = Constants.secondaryColor,
    Color? iconColor = Constants.primaryColor,
    Key? key,
  }) : this(
          icon: Icons.arrow_back_ios_rounded,
          onTap: () {
            if (context.canPop()) {
              FocusNode().unfocus();
              context.pop();
            } else {
              context.go('/home');
            }
          },
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          key: key,
        );

  final IconData _iconData;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ClipRRect(
              borderRadius: Constants.mainBorderRadius,
              child: BackdropFilter(
                filter: Constants.imageFilterBlur,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: Constants.mainBorderRadius,
            child: Padding(
              padding: Constants.buttonPadding,
              child: Icon(
                _iconData,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
