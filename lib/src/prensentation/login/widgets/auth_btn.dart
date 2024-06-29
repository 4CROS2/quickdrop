import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/capitalize.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    required String label,
    VoidCallback? onTap,
    super.key,
  })  : _onTap = onTap,
        _label = label;
  final VoidCallback? _onTap;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 12.1,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: Material(
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: _onTap,
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Center(
              child: Text(
                _label.capitalize(),
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontFamily: 'RedHat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
