import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/quantity/widgets/quantity_button.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/quantity/widgets/quantity_text_field.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key});

  @override
  State<Quantity> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<Quantity> {
  late final TextEditingController _controller;
  late final PurchaseCubit _purchaseCubit;
  @override
  void initState() {
    super.initState();
    _purchaseCubit = context.read<PurchaseCubit>();
    _controller = TextEditingController(
      text: _purchaseCubit.state.product.quantity.toString(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseCubit, PurchaseState>(
      listener: (BuildContext context, PurchaseState state) {
        _controller.text = state.product.quantity.toString();
      },
      builder: (BuildContext context, PurchaseState state) {
        return ClipRRect(
          borderRadius: Constants.mainBorderRadius,
          child: Material(
            color: Constants.secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                QuantityButton(
                  onTap: () => _purchaseCubit.removeQuantity(),
                  icon: Icons.remove,
                ),
                QuantityTextField(
                  controller: _controller,
                ),
                QuantityButton(
                  onTap: () => _purchaseCubit.addQuantity(),
                  icon: Icons.add,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
