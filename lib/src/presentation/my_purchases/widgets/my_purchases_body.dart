import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/presentation/my_purchases/cubit/my_purchases_cubit.dart';
import 'package:quickdrop/src/presentation/my_purchases/widgets/my_purchase_tile.dart';

class MyPurchasesBody extends StatefulWidget {
  const MyPurchasesBody({
    required List<MyPurchasesEntity> purchases,
    super.key,
  }) : _purchases = purchases;
  final List<MyPurchasesEntity> _purchases;

  @override
  State<MyPurchasesBody> createState() => _MyPurchasesBodyState();
}

class _MyPurchasesBodyState extends State<MyPurchasesBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => context.read<MyPurchasesCubit>().getMyPurchases(),
      child: ListView.builder(
        physics: Constants.bouncingScrollPhysics,
        itemCount: widget._purchases.length,
        padding: Constants.mainPadding,
        itemBuilder: (BuildContext context, int index) {
          final MyPurchasesEntity product = widget._purchases[index];
          final String year = product.time.year.toString();
          final String month = product.time.month.toString();
          final String day = product.time.day.toString();
          final String date = '$year - $month - $day';
          return Padding(
            padding: Constants.paddingTop,
            child: Material(
              borderRadius: Constants.mainBorderRadius,
              color: Constants.secondaryColor,
              child: Padding(
                padding: Constants.mainPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Constants.mainPaddingValue,
                  children: <Widget>[
                    Text(date),
                    ...product.purchase.map(
                      (PurchaseEntity entity) {
                        return MyPurchasetile(
                          pruchase: entity,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
