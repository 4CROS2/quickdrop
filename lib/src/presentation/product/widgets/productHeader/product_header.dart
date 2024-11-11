import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    required String previewImage,
  }) : _previewImage = previewImage;

  final String _previewImage;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / (maxExtent - minExtent);
    final double opacity =
        ((percent <= 0.4) ? 0.0 : (percent - 0.4) * 2).clamp(0.0, 1.0);
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (BuildContext context, ProductDetailState state) {
        return Material(
          color: Colors.black12,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (state is! SuccessLoadingProduct)
                Hero(
                  transitionOnUserGestures: true,
                  tag: _previewImage,
                  child: ClipperRadiusImages(
                    child: ImageLoader(
                      imageUrl: _previewImage,
                    ),
                  ),
                ),
              if (state is SuccessLoadingProduct)
                Carousel(
                  images: state.product.baseImages,
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
                              title: state is SuccessLoadingProduct
                                  ? state.product.name
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
      },
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
