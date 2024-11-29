import 'package:extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    required String label,
    bool disabled = false,
    VoidCallback? onTap,
    super.key,
  })  : _onTap = onTap,
        _label = label,
        _disabled = disabled;
  final VoidCallback? _onTap;
  final String _label;
  final bool _disabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _disabled,
      child: DecoratedBox(
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
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: switch (_disabled) {
                    true => const CupertinoActivityIndicator(),
                    false => Text(
                        _label.capitalize(),
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontFamily: 'RedHat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
