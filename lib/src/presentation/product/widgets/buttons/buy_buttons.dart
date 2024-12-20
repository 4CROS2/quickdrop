import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/product/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/presentation/product/widgets/buttons/buy_buttons_tile.dart.dart';
import 'package:quickdrop/src/presentation/product/widgets/quantity/quantity.dart';

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
      child: BlocConsumer<PurchaseCubit, PurchaseState>(
        listener: (BuildContext context, PurchaseState state) {},
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
                          onTap: context.read<PurchaseCubit>().buyProduct,
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
                    onTap: context.read<PurchaseCubit>().addToCart,
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
