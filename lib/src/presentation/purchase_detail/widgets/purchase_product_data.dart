import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class ProductData extends StatelessWidget {
  const ProductData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        elevation: 2,
        shadowColor: Colors.transparent,
        borderRadius: Constants.mainBorderRadius,
        surfaceTintColor: Constants.primaryColor,
        child: Padding(
          padding: Constants.mainPadding / 4,
          child: Row(
            spacing: Constants.mainPaddingValue,
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: ImageLoader(imageUrl: ''),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Product Name',
                  ),
                  Text(
                    'Product Description',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
