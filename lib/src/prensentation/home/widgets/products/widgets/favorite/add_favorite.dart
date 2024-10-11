import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/favorites/favorites.dart';
import 'package:quickdrop/src/prensentation/home/widgets/products/widgets/favorite/cubit/add_favorite_cubit.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({required String productId, super.key})
      : _productId = productId;
  final String _productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddToFavoriteCubit>(
      create: (BuildContext context) =>
          sl<AddToFavoriteCubit>()..checkFavorite(productId: _productId),
      child: Material(
        borderRadius: Constants.mainBorderRadius / 2,
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Constants.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
            BlocConsumer<AddToFavoriteCubit, AddFavoriteState>(
              listener: (BuildContext context, AddFavoriteState state) {
                if (state.message != '') {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message.capitalize(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        elevation: 0,
                        backgroundColor: Constants.primaryColor,
                        actionOverflowThreshold: 0.75,
                        action: SnackBarAction(
                          onPressed: () => PageNavigation.pushNavigator(
                            context,
                            page: Favorites(),
                          ),
                          label: 'favoritos'.capitalize(),
                          textColor: Constants.primaryColor,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                }
              },
              builder: (BuildContext context, AddFavoriteState state) {
                return InkWell(
                  onTap: () =>
                      context.read<AddToFavoriteCubit>().addOrRemoveToFavorite(
                            productId: _productId,
                          ),
                  child: Padding(
                    padding: Constants.mainPadding / 2,
                    child: AnimatedSwitcher(
                      duration: Constants.animationTransition,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        key: Key(state.toString()),
                        state.favorite == Favorite.added
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
