import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({
    required TextEditingController controller,
    required bool isEnabled,
    required String label,
    bool isObscure = false,
    super.key,
  })  : _controller = controller,
        _label = label,
        _isObscure = isObscure,
        _isEnabled = isEnabled;
  final TextEditingController _controller;
  final String _label;
  final bool _isObscure;
  final bool _isEnabled;

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
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        controller: widget._controller,
        obscureText: widget._isObscure && obscure,
        style: const TextStyle(
          fontFamily: 'Questrial',
        ),
        decoration: InputDecoration(
          hintText: widget._label,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
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
          suffixIconColor: Colors.white,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 20).add(
            const EdgeInsets.only(left: 20),
          ),
          enabledBorder: Constants.authBorder,
          focusedBorder: Constants.authBorder,
          disabledBorder: Constants.authBorder,
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
