import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Destination extends StatelessWidget {
  const Destination({
    required IconData icon,
    required String label,
    super.key,
  })  : _icon = icon,
        _label = label;

  final IconData _icon;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: HugeIcon(
        icon: _icon,
        color: Theme.of(context).iconTheme.color!,
      ),
      label: _label,
    );
  }
}
