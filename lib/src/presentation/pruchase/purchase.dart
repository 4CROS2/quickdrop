import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/presentation/pruchase/widgets/purchase_header.dart';

class Purchase extends StatefulWidget {
  const Purchase({
    required String productName,
    super.key,
  }) : _productName = productName;
  final String _productName;
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext _) {
    return BlocProvider<PurchaseCubit>.value(
      value: sl<PurchaseCubit>(),
      child: BlocBuilder<PurchaseCubit, PurchaseState>(
        builder: (BuildContext context, PurchaseState state) {
          return Scaffold(
            appBar: PruchaseAppBar(),
            body: SingleChildScrollView(
              padding: Constants.mainPadding,
              physics: Constants.bouncingScrollPhysics,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Constants.mainPaddingValue,
                children: <Widget>[
                  _productInformation(
                    label: 'nombre de producto',
                    data: widget._productName,
                  ),
                  _productInformation(
                    label: 'precio',
                    data: formatPrice(
                      state.product.currentPrice,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _productInformation({required String label, required String data}) {
    return Text.rich(
      TextSpan(
        text: '$label: '.capitalize(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: data.toTitleCase(),
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
