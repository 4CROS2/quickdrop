import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/card_tile.dart';
// import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/payment_section.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  /*  late final PurchaseCubit _purchaseCubit;
  @override
  void initState() {
    super.initState();
    _purchaseCubit = context.read<PurchaseCubit>();
  } */

  @override
  Widget build(BuildContext context) {
    return PaymentSection(
      title: 'Tarjeta de pago',
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          spacing: Constants.mainPaddingValue,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CartTile(
              cardNumber: '**** **** **** 1234',
            ),
            CartTile(
              cardNumber: '**** **** **** 1234',
            ),
          ],
        ),
      ),
    );
  }
}
