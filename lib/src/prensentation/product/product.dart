import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/product/productCubit/product_cubit.dart';
import 'package:quickdrop/src/prensentation/product/widgets/buttons/buy_buttons.dart';
import 'package:quickdrop/src/prensentation/product/widgets/productHeader/product_header.dart';
import 'package:quickdrop/src/prensentation/product/widgets/vendor/vendor.dart';

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
  final String title = 'lets go flutter ';
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
      body: BlocProvider<ProductCubit>(
        create: (BuildContext context) => sl<ProductCubit>(),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            await Future<void>.delayed(
              const Duration(seconds: 1),
            );
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
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
              BlocBuilder<ProductCubit, ProductState>(
                builder: (BuildContext context, ProductState state) =>
                    SliverToBoxAdapter(
                  child: AnimatedSwitcher(
                    duration: Constants.animationTransition,
                    child: switch (state) {
                      SuccessLoadingProducts _ => ProductBody(title: title),
                      ErrorLoadingProducts _ => const Center(
                          child: Text('error'),
                        ),
                      _ => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  const ProductBody({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //product name
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              //product price
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: Constants.mainBorderRadius,
                ),
                child: Padding(
                  padding: Constants.mainPadding,
                  child: Text(
                    formatPrice(213444),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Constants.mainPadding.top),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.12),
                borderRadius: Constants.mainBorderRadius,
              ),
              child: Padding(
                padding: Constants.mainPadding.copyWith(
                  bottom: Constants.mainPadding.top,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'descripción'.capitalize(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'asdashjka sadfhsjadfh '.capitalizeSentences(),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const BuyButtons(),
          //vendor data
          const Vendor(),
          //other products
          ...List<Text>.generate(
            100,
            (int index) => Text(
              index.toString(),
            ),
          )
        ],
      ),
    );
  }
}
