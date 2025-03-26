import 'package:apptoastification/apptoastification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/favorites/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/products/widgets/favorite/cubit/add_favorite_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

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
                  filter: Constants.imageFilterBlur,
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
                final bool isUserAction = state.isUserAction;
                final bool hasAdded = state.favorite == Favorite.added;
                final bool hasRemoved = state.favorite == Favorite.removed;

                if (hasAdded && isUserAction) {
                  AppToastification.showSuccess(
                    context: context,
                    message: 'agregado a favoritos',
                  );
                }
                if (hasRemoved && isUserAction) {
                  AppToastification.showSuccess(
                    context: context,
                    message: 'removido de tus favoritos',
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
