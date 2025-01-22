import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/usecase/purshase_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/product/widgets/buttons/buy_buttons_tile.dart.dart';
import 'package:quickdrop/src/presentation/product/widgets/quantity/quantity.dart';
import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';

class BuyButtons extends StatefulWidget {
  const BuyButtons({
    required String productId,
    super.key,
  }) : _productId = productId;

  final String _productId;

  @override
  State<BuyButtons> createState() => _BuyButtonsState();
}

class _BuyButtonsState extends State<BuyButtons> {
  @override
  void initState() {
    super.initState();
    if (!sl.isRegistered<PurchaseCubit>()) {
      sl.registerCachedFactory(
        () => PurchaseCubit(
          usecase: sl<PurchaseUsecase>(),
        ),
      );
    }
  }

  @override
  void dispose() {
    if (sl.isRegistered<PurchaseCubit>()) {
      sl.unregister<PurchaseCubit>();
    }
    super.dispose();
  }

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
                          onTap: () => context.push(
                            Uri(
                              path:
                                  '/product/${widget._productId}/financialinformation',
                            ).toString(),
                          ),
                          prefixIcon: Icons.shopping_cart_checkout_rounded,
                          backgroundColor: Constants.primaryColor,
                          label: 'comprar ahora',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Constants.mainPadding.top,
                  ),
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

/* 
 ..setProductData(
          buyerId: _appState.user.id,
          sellerId: _state.product.sellerData.sellerId,
          productId: _state.product.productId,
          currentPrice: _state.product.basePrice,
        )

 */
