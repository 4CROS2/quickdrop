import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/prensentation/product/purchaseCubit/purchase_cubit.dart';

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
        onChanged: (String value) {
          context.read<PurchaseCubit>().setQuantity(
                value: value,
              );
        },
        showCursor: false,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
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
