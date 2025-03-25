import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/average.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/feature/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/feature/home/presentation/widgets/products/widgets/favorite/add_favorite.dart';
import 'package:quickdrop/src/presentation/widgets/clipper_radius_images.dart';
import 'package:shimmer/shimmer.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    required ProductsEntity product,
    required int index,
    super.key,
  })  : _product = product,
        _index = index;

  final ProductsEntity _product;
  final int _index;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile>
    with TickerProviderStateMixin {
  late final double height;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
    );
    _animation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: -.2,
        ), // Subida con desaceleración
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: -.2,
          end: 0,
        ),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    final int delay = (widget._index * 100).clamp(0, 500); // Límite de 500 ms
    Future<void>.delayed(Duration(milliseconds: delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
    height = 100 + Random().nextDouble() * (160 - 100);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
            0,
            20 * _animation.value,
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: Constants.mainPadding / 2,
        child: Material(
          elevation: 12,
          clipBehavior: Clip.hardEdge,
          borderRadius: Constants.mainBorderRadius,
          shadowColor: Colors.transparent,
          surfaceTintColor: Constants.primaryColor,
          child: InkWell(
            onTap: () {
              context.push(
                Uri(
                  path: '/product/${widget._product.id}',
                  queryParameters: <String, dynamic>{
                    'previewImage': widget._product.baseImages.first
                  },
                ).toString(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(
                        transitionOnUserGestures: true,
                        tag: widget._product.baseImages.first,
                        child: ClipperRadiusImages(
                          borderRadius: Constants.mainBorderRadius / 2,
                          child: SizedBox(
                            height: height,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: widget._product.baseImages[0],
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, String url) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: height,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: Constants.buttonPadding.top / 2,
                        right: Constants.buttonPadding.right / 2,
                        child: AddToFavoriteButton(
                          productId: widget._product.id,
                        ),
                      )
                    ],
                  ),
                  // product informations
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //product rating
                      Row(
                        spacing: Constants.mainPaddingValue / 2,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: average(
                              ratings: widget._product.ratings,
                            ),
                            maxRating: 5,
                            size: 18,
                          ),
                          Text(
                            '( ${widget._product.ratings.length.toString()} )',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      //product name
                      Text(
                        widget._product.name.capitalize(),
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            height: .8),
                      ),
                      //product price
                      Text(
                        formatPrice(widget._product.basePrice),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Constants.primaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
