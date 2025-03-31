import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/products/widgets/product_tile.dart';

class Products extends StatefulWidget {
  const Products({
    required List<ProductsEntity> products,
    super.key,
  }) : _products = products;
  final List<ProductsEntity> _products;
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    if (widget._products.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Material(
            surfaceTintColor: Constants.secondaryColor,
            elevation: 5,
            borderRadius: Constants.mainBorderRadius,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: Constants.mainPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Constants.mainPaddingValue,
                children: <Widget>[
                  Icon(
                    Icons.inbox,
                    color: Constants.secondaryColor,
                    size: 60,
                        
                  ),
                  Text(
                    'no hay productos disponibles'.capitalize(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
        padding: Constants.mainPadding / 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget._products.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductTile(
            index: index,
            product: widget._products[index],
          );
        },
      ),
    );
  }
}
