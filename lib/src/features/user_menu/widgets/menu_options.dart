import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingTop,
      child: Column(
        children: <_OptionTile>[
          _OptionTile(
            icon: HugeIcons.strokeRoundedNotification03,
            routePath: '/notifications',
            label: 'notificaciones',
          ),
          _OptionTile(
            icon: HugeIcons.strokeRoundedShoppingCartCheck02,
            label: 'mis compras',
            routePath: '/mypurchases',
          ),
          _OptionTile(
            icon: HugeIcons.strokeRoundedFavourite,
            label: 'favoritos',
            routePath: '/favorites',
          ),
          _OptionTile(
            icon: HugeIcons.strokeRoundedTime02,
            routePath: '/history',
            label: 'historial',
          ),
          _OptionTile(
            icon: HugeIcons.strokeRoundedUser03,
            routePath: '/settings/profile',
            label: 'cuenta',
          ),
          _OptionTile(
            icon: HugeIcons.strokeRoundedSettings05,
            routePath: '/settings',
            label: 'ajustes',
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.routePath,
    required this.label,
  });
  final IconData icon;
  final String routePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Constants.mainBorderRadius,
      onTap: () => context.push(routePath),
      child: Padding(
        padding: Constants.mainPadding,
        child: Row(
          spacing: Constants.mainPaddingValue,
          children: <Widget>[
            Icon(icon),
            Text(
              label.capitalize(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
