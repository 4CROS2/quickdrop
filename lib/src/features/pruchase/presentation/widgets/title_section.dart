import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    required String label,
    super.key,
  }) : _label = label;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Text(
      _label.capitalize(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
