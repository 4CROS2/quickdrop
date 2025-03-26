import 'package:apptoastification/apptoastification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/pruchase/presentation/cubit/purchase_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/confirm_button/confrim_button.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/delivery_address.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/delivery_option.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/payment_method.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/product_information.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/purchase_header.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class Purchase extends StatefulWidget {
  const Purchase({
    super.key,
  });

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext _) {
    return BlocProvider<PurchaseCubit>.value(
      value: sl<PurchaseCubit>(),
      child: BlocConsumer<PurchaseCubit, PurchaseState>(
        listener: (BuildContext context, PurchaseState state) {
          if (state.purchaseStatus == PurchaseStatus.error) {
            AppToastification.showError(
              context: context,
              message: state.message,
            );
          }
          if (state.purchaseStatus == PurchaseStatus.success) {
            context.pushReplacement(
              Uri(
                path: '/purchaseDetail/${state.purchaseId}',
                queryParameters: <String, dynamic>{
                  'sellerId': state.product.sellerId,
                },
              ).toString(),
            );
          }
        },
        builder: (BuildContext context, PurchaseState state) {
          return Scaffold(
            appBar: PruchaseAppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    padding: Constants.mainPadding,
                    physics: Constants.bouncingScrollPhysics,
                    children: <Widget>[
                      ProductInformation(
                        product: state.product,
                      ),
                      PaymentMethod(),
                      DeliveryOption(),
                      DeliveryAddress(),
                    ],
                  ),
                ),
                ConfirmButton()
              ],
            ),
          );
        },
      ),
    );
  }
}
