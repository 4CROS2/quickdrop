import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/pruchase/presentation/cubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/confirm_button/widgets/information_tile.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton>
    with SingleTickerProviderStateMixin {
  late final PurchaseCubit _purchaseCubit;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _purchaseCubit = context.read<PurchaseCubit>();

    _controller = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar recursos
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseCubit, PurchaseState>(
      listener: (BuildContext context, PurchaseState state) {
        final bool shouldAnimate =
            state.product.deliverymethod == Deliverymethod.delivery ||
                state.product.deliverymethod == Deliverymethod.store;

        if (shouldAnimate) {
          _controller.forward();
        } else if (!shouldAnimate) {
          _controller.reverse();
        }
      },
      builder: (BuildContext context, PurchaseState state) {
        final int quantity = state.product.quantity;
        final int price = state.product.currentPrice;
        const int deliveryPrice = 4000;
        final int total = quantity * price +
            (state.product.deliverymethod == Deliverymethod.delivery
                ? deliveryPrice
                : 0);

        return Material(
          elevation: 2,
          surfaceTintColor: Constants.primaryColor,
          child: Padding(
            padding: Constants.mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Constants.mainPaddingValue / 3,
              children: <Widget>[
                if (state.product.deliverymethod == Deliverymethod.delivery)
                  InformationTile(
                    label: 'Domicilio',
                    data: deliveryPrice,
                    fontSize: 14,
                  ),
                InformationTile(
                  label: 'Subtotal',
                  data: price * quantity,
                ),
                const Divider(height: 1),
                InformationTile(
                  label: 'Total',
                  data: total,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) {
                      return Material(
                        color: Color.lerp(
                          Constants.secondaryColor,
                          Constants.primaryColor,
                          _animation.value,
                        ),
                        borderRadius: Constants.mainBorderRadius,
                        child: IgnorePointer(
                          ignoring: _purchaseCubit.deliveryState(),
                          child: InkWell(
                            onTap: () => _purchaseCubit.buyProduct(),
                            borderRadius: Constants.mainBorderRadius,
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: Constants.animationTransition,
                                child: switch (state.purchaseStatus) {
                                  PurchaseStatus.loading =>
                                    const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  PurchaseStatus.success => const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                    ),
                                  PurchaseStatus.error => const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                  PurchaseStatus.initial => Text(
                                      'confirmar compra'.toTitleCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
