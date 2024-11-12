import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/product/productCubit/product_cubit.dart';
import 'package:quickdrop/src/presentation/product/widgets/productHeader/widgets/carrousell.dart';
import 'package:quickdrop/src/presentation/product/widgets/productHeader/widgets/title_header.dart';
import 'package:quickdrop/src/presentation/widgets/clipper_radius_images.dart';
import 'package:quickdrop/src/presentation/widgets/header_buton.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class ProductHeader extends SliverPersistentHeaderDelegate {
  ProductHeader({
    required ProductDetailState state,
    required String previewImage,
  })  : _state = state,
        _previewImage = previewImage;

  final String _previewImage;
  final ProductDetailState _state;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / (maxExtent - minExtent);
    final double opacity =
        ((percent <= 0.4) ? 0.0 : (percent - 0.4) * 2).clamp(0.0, 1.0);
    return Material(
      color: Colors.black12,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (_state is SuccessLoadingProduct)
            Carousel(
              images: _state.product.baseImages,
            ),
          if (_state is! SuccessLoadingProduct)
            Hero(
              transitionOnUserGestures: true,
              tag: _previewImage,
              child: ClipperRadiusImages(
                child: ImageLoader(
                  imageUrl: _previewImage,
                ),
              ),
            ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: opacity,
              child: SizedBox(
                height: minExtent,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: Constants.iamgeFilterBlur,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Constants.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding.right,
                ).copyWith(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        HeaderButtons(
                          onTap: () => context.go('/home'),
                          icon: Icons.arrow_back_ios_new_rounded,
                          backgroundColor: Colors.black45,
                          iconColor: Colors.white,
                        ),
                        TitleHeader(
                          title: _state is SuccessLoadingProduct
                              ? (_state).product.name
                              : '',
                          showText: percent >= 1.1,
                        ),
                      ],
                    ),
                    const HeaderButtons(
                      icon: Icons.shopping_cart_outlined,
                      backgroundColor: Colors.black45,
                      iconColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  final double maxExtent = 340;
  @override
  double minExtent = Constants.minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
