import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/feature/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/feature/home/presentation/widgets/products/widgets/product_tile.dart';

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
      return Center(
        child: Text(
          'no hay productos disponibles',
        ),
      );
    }

    return MasonryGridView.builder(
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
    );
  }
}
