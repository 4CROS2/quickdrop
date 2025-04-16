import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/widgets/empty_purchases.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/widgets/my_purchase_tile.dart';

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
    return widget._purchases.isEmpty
        ? const SliverToBoxAdapter(child: EmptyPurchases())
        : _buildList();
  }

  Widget _buildList() {
    return SliverList.builder(
      itemCount: widget._purchases.length,
      itemBuilder: (BuildContext context, int index) {
        final MyPurchasesEntity product = widget._purchases[index];
        final String year = product.time.year.toString();
        final String month =
            DateFormat.MMMM('es_ES').format(product.time).capitalize();
        final String day = product.time.day.toString();
        final String date = ' $day de $month del $year';
        return Padding(
          padding: Constants.paddingTop,
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            color: Constants.secondaryColor,
            child: Padding(
              padding: Constants.mainPadding / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Constants.mainPaddingValue / 2,
                children: <Widget>[
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...product.purchase.map(
                    (PurchaseEntity entity) {
                      return MyPurchasetile(
                        purchase: entity,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
