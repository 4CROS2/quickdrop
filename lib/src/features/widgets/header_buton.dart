import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required IconData icon,
    bool badgeVisible = false,
    this.onTap,
    this.backgroundColor = Constants.secondaryColor,
    this.iconColor,
    super.key,
  })  : _iconData = icon,
        _badgeVisible = badgeVisible;

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
  final bool _badgeVisible;

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
              child: Badge(
                backgroundColor: Colors.black,
                label: const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'AlbertSans',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                isLabelVisible: _badgeVisible,
                child: Icon(
                  _iconData,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
