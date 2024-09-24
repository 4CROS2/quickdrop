import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/prensentation/product/widgets/product_header.dart';

class Product extends StatefulWidget {
  const Product({
    required String index,
    required String productImg,
    super.key,
  })  : _index = index,
        _productImg = productImg;
  final String _index;
  final String _productImg;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late final ScrollController _scrollController;
  final String title = 'lets go flutter';
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: ProductHeader(
              title: title,
              heroTag: widget._index,
              productImg: widget._productImg,
            ),
          ),
          
          SliverPadding(
            padding: Constants.mainPadding,
            sliver: SliverToBoxAdapter(
              //product name
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) => Text(
              index.toString(),
            ),
          ), 
        ],
      ),
    );
  }
}
