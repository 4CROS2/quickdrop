import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/product/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/prensentation/product/widgets/buttons/buy_buttons_tile.dart.dart';
import 'package:quickdrop/src/prensentation/product/widgets/quantity/quantity.dart';

class BuyButtons extends StatefulWidget {
  const BuyButtons({super.key});

  @override
  State<BuyButtons> createState() => _BuyButtonsState();
}

class _BuyButtonsState extends State<BuyButtons> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PurchaseCubit>(
      create: (BuildContext context) => sl<PurchaseCubit>(),
      child: BlocBuilder<PurchaseCubit, PurchaseState>(
        builder: (BuildContext context, PurchaseState state) {
          return Padding(
            padding: EdgeInsets.only(
              top: Constants.mainPadding.top,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        child: Quantity(),
                      ),
                      SizedBox(
                        width: Constants.mainPadding.top,
                      ),
                      Flexible(
                        flex: 2,
                        child: BuyButtonTile(
                          onTap: () {},
                          prefixIcon: Icons.shopping_cart_checkout_rounded,
                          label: 'comprar ahora',
                          backgroundColor: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Constants.mainPadding.top),
                  child: BuyButtonTile(
                    onTap: () {},
                    label: 'agregar al carrito',
                    prefixIcon: Icons.add_shopping_cart_rounded,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
