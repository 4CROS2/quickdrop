import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';

class NewLocationInput extends StatelessWidget {
  NewLocationInput({
    required this.controller,
    required this.label,
    this.validator,
    this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;

  final TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: _textStyle,
      validator: validator,
      decoration: InputDecoration(
        labelText: label.capitalize(),
        labelStyle: _textStyle,
      ),
    );
  }
}
