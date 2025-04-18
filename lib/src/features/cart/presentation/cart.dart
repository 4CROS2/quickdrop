import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:quickdrop/src/features/cart/presentation/widgets/bottom_menu.dart';
import 'package:quickdrop/src/features/cart/presentation/widgets/product_cart_tile.dart';
import 'package:quickdrop/src/features/loading/loading.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (BuildContext context) => sl<CartCubit>(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (BuildContext context, CartState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'mi carrito'.capitalize(),
              ),
            ),
            body: AnimatedSwitcher(
              duration: Constants.animationTransition,
              child: switch (state) {
                Loading _ => const LoadingPage(),
                Error _ => Center(
                    child: Text(
                      state.message,
                    ),
                  ),
                Success _ => CustomScrollView(
                    slivers: <Widget>[
                      SliverList.separated(
                        itemCount: state.products.length,
                        separatorBuilder: (BuildContext context, int index) {
                          final double padding = Constants.mainPaddingValue;
                          return Divider(
                            indent: padding,
                            endIndent: padding,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCartTile(
                            product: state.products[index],
                          );
                        },
                      ),
                    ],
                  )
              },
            ),
            bottomNavigationBar: state is Success
                ? BottomMenu(
                    products: state.products,
                  )
                : const SizedBox(),
          );
        },
      ),
    );
  }
}
