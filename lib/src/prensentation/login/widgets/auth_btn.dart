import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    VoidCallback? onTap,
    super.key,
  }) : _onTap = onTap;
  final VoidCallback? _onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius,
      child: InkWell(
        onTap: _onTap,
        child: const SizedBox(
          width: double.infinity,
          height: 60,
        ),
      ),
    );
  }
}
