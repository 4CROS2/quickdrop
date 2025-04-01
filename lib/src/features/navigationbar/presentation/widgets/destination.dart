import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class Destination extends StatelessWidget {
  Destination({
    required IconData icon,
    required String label,
    bool showBadge = false,
    super.key,
  })  : _icon = icon,
        _label = label.capitalize(),
        _showBadge = showBadge;

  final IconData _icon;
  final String _label;
  final bool _showBadge;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      tooltip: _label,
      selectedIcon: _iconNavigation(
        context,
        color: Constants.secondaryColor,
      ),
      icon: _iconNavigation(
        context,
        color: Theme.of(context).iconTheme.color!,
      ),
      label: _label,
    );
  }

  Widget _iconNavigation(BuildContext context, {required Color color}) {
    return Badge.count(
      count: 1,
      isLabelVisible: _showBadge,
      offset: Offset(5, -5),
      child: HugeIcon(
        icon: _icon,
        color: color,
      ),
    );
  }
}
