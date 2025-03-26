import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/pruchase/presentation/cubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/payment_section.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final PurchaseCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<PurchaseCubit>();
    _controller = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DeliveryAddress oldWidget) {
    if (_cubit.state.product.deliverymethod == Deliverymethod.delivery) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        if (_animation.value == 0) {
          return const SizedBox.shrink();
        }
        return FadeTransition(
          opacity: _animation,
          child: child,
        );
      },
      child: PaymentSection(
        title: 'Direccion de entrega',
        child: TextField(
          controller: _controller,
          showCursor: true,
          onChanged: (String value) {
            context
                .read<PurchaseCubit>()
                .setAddress(address: GeoPoint(0, 0), description: value);
          },
          cursorOpacityAnimates: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(
              borderRadius: Constants.mainBorderRadius / 2,
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
