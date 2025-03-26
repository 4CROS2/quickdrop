import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/features/pruchase/presentation/cubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/payment_section.dart';

class DeliveryOption extends StatefulWidget {
  const DeliveryOption({super.key});

  @override
  State<DeliveryOption> createState() => _DeliveryOptionState();
}

class _DeliveryOptionState extends State<DeliveryOption> {
  @override
  Widget build(BuildContext context) {
    return PaymentSection(
      title: 'Método de entrega',
      child: Column(
        spacing: Constants.mainPaddingValue,
        children: <Widget>[
          _DeliveryOption(
            index: 0,
            title: 'Envio a domicilio',
            icon: Icons.delivery_dining_outlined,
          ),
          _DeliveryOption(
            index: 1,
            title: 'Recoger en la tienda',
            icon: Icons.storefront_outlined,
          )
        ],
      ),
    );
  }
}

class _DeliveryOption extends StatefulWidget {
  const _DeliveryOption({
    required this.title,
    required this.index,
    this.icon,
  });
  final String title;
  final IconData? icon;
  final int index;

  @override
  State<_DeliveryOption> createState() => __DeliveryOptionState();
}

class __DeliveryOptionState extends State<_DeliveryOption> {
  late final PurchaseCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<PurchaseCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      child: InkWell(
        onTap: () => _cubit.setDeliveryMethod(
          value: widget.index,
        ),
        splashColor: Constants.primaryColor.withValues(
          alpha: .1,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Padding(
            padding: EdgeInsets.only(
              right: Constants.mainPaddingValue,
            ),
            child: Row(
              children: <Widget>[
                Radio<int>(
                  value: widget.index,
                  groupValue: _cubit.state.product.deliverymethod.index,
                  onChanged: (int? value) {
                    _cubit.setDeliveryMethod(
                      value: value!,
                    );
                  },
                ),
                Text.rich(
                  TextSpan(
                    text: widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: widget.index == 0
                            ? ' (${formatPrice(4000)})'
                            : ' (Gratis)',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  widget.icon,
                  color: Constants.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
