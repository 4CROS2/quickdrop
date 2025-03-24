import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/home/widgets/products/widgets/product_tile.dart';

class LastSeen extends StatelessWidget {
  const LastSeen({
    required this.lastSeenProducts,
    super.key,
  });
  final List<ProductsEntity> lastSeenProducts;

  @override
  Widget build(BuildContext context) {
    if (lastSeenProducts.isEmpty) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: Constants.mainPadding,
      child: Material(
        elevation: 2,
        surfaceTintColor: Constants.primaryColor,
        shadowColor: Colors.transparent,
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: Constants.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Visto anteriormente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: Constants.mainPadding,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Constants.mainPaddingValue,
                  mainAxisSpacing: Constants.mainPaddingValue,
                  childAspectRatio: 2,
                ),
                itemCount: lastSeenProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductTile(
                    product: lastSeenProducts[index],
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
