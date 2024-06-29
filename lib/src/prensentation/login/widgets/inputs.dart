import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({
    required TextEditingController controller,
    required bool isEnabled,
    required String label,
    double bottomPadding = 25.0,
    Icon? prefixIcon,
    String? Function(String?)? validator,
    bool isObscure = false,
    super.key,
  })  : _controller = controller,
        _label = label,
        _bottomPadding = bottomPadding,
        _validator = validator,
        _isObscure = isObscure,
        _isEnabled = isEnabled,
        _prefixIcon = prefixIcon;
  final TextEditingController _controller;
  final String _label;
  final bool _isObscure;
  final bool _isEnabled;
  final String? Function(String?)? _validator;
  final Icon? _prefixIcon;
  final double _bottomPadding;

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool obscure = true;

  void changeVisibility() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget._bottomPadding),
      child: TextFormField(
        controller: widget._controller,
        obscureText: widget._isObscure && obscure,
        style: Constants.inputsTextStyle,
        validator: widget._validator,
        decoration: InputDecoration(
          hintText: widget._label,
          hintStyle: Constants.inputsTextStyle,
          suffixIcon: widget._isObscure
              ? InkWell(
                  onTap: changeVisibility,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                )
              : null,
          prefixIcon: widget._prefixIcon,
          suffixIconColor: Colors.black,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 20).add(
            const EdgeInsets.only(left: 20),
          ),
          enabledBorder: Constants.authBorder,
          focusedBorder: Constants.authBorder,
          focusedErrorBorder: Constants.authBorder,
          disabledBorder: Constants.authBorder,
          errorBorder: Constants.authBorder,
          errorStyle: Constants.inputsTextStyle,
          enabled: widget._isEnabled,
          fillColor: const Color(0xFFFCFCFC).withOpacity(.54),
          filled: true,
        ),
        cursorOpacityAnimates: true,
        enabled: widget._isEnabled,
      ),
    );
  }
}
