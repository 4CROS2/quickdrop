import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/product/productCubit/product_cubit.dart';
import 'package:quickdrop/src/presentation/product/widgets/body/product_body.dart';
import 'package:quickdrop/src/presentation/product/widgets/productHeader/product_header.dart';

class Product extends StatefulWidget {
  const Product({
    required String productId,
    required String previewImage,
    super.key,
  })  : _productId = productId,
        _previewImage = previewImage;

  final String _previewImage;
  final String _productId;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late final ScrollController _scrollController;
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
      body: BlocProvider<ProductDetailCubit>(
        create: (BuildContext context) => sl<ProductDetailCubit>()
          ..getProductData(productId: widget._productId),
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
                  previewImage: widget._previewImage,
                ),
              ),
              BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (BuildContext context, ProductDetailState state) =>
                    SliverToBoxAdapter(
                  child: AnimatedSwitcher(
                    duration: Constants.animationTransition,
                    child: switch (state) {
                      SuccessLoadingProduct _ => ProductBody(
                          product: state.product,
                        ),
                      ErrorLoadingProduct _ => Center(
                          child: Text(state.message),
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
