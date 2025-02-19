import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class MyPurchasetile extends StatelessWidget {
  const MyPurchasetile({
    required PurchaseEntity pruchase,
    super.key,
  }) : _purchase = pruchase;
  final PurchaseEntity _purchase;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      child: InkWell(
        onTap: () => context.push('/purchaseDetail/${_purchase.sellerId}'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Constants.mainPaddingValue / 2,
          children: <Widget>[
            Padding(
              padding: Constants.mainPadding / 2,
              child: SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: Constants.mainBorderRadius / 6,
                  child: ImageLoader(
                    imageUrl: _purchase.imagePath,
                  ),
                ),
              ),
            ),
            Text(
              _purchase.productName.toTitleCase(),
            )
          ],
        ),
      ),
    );
  }
}
