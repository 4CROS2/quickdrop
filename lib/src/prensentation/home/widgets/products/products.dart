import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/prensentation/home/widgets/products/widgets/product_tile.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
        padding: Constants.mainPadding / 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 100,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductTile(
            index: index,
          );
        },
      ),
    );
  }
}
