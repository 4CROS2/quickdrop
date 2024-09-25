import 'package:flutter/material.dart';

class QuantityTextField extends StatefulWidget {
  const QuantityTextField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;
  final TextEditingController _controller;
  @override
  State<QuantityTextField> createState() => _QuantityTextFieldState();
}

class _QuantityTextFieldState extends State<QuantityTextField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: widget._controller,
        showCursor: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: false,
        ),
      ),
    );
  }
}
