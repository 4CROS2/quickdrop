import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/productDetail/presentation/cubit/product_cubit.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/body/product_body.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/loading/loading_product_shimmer.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/productHeader/product_header.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    required String productId,
    required String previewImage,
    super.key,
  })  : _productId = productId,
        _previewImage = previewImage;

  final String _previewImage;
  final String _productId;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
          ..getProductData(
            productId: widget._productId,
          ),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (BuildContext context, ProductDetailState state) {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                await context.read<ProductDetailCubit>().refresh(
                      productId: widget._productId,
                    );
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: state is LoadingProduct
                    ? NeverScrollableScrollPhysics()
                    : Constants.bouncingScrollPhysics,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: ProductHeader(
                      state: state,
                      previewImage: widget._previewImage,
                    ),
                  ),
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
                        _ => LoadingProductShimmer()
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
