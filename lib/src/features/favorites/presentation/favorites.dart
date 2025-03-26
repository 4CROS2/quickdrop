import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/custom_snack_bar.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:quickdrop/src/features/favorites/presentation/widgets/favorite_body.dart';
import 'package:quickdrop/src/features/favorites/presentation/widgets/favorite_header.dart';
import 'package:quickdrop/src/presentation/widgets/loading_status.dart';
import 'package:quickdrop/src/presentation/widgets/swich_transition.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (BuildContext context) =>
          sl<FavoritesCubit>()..getUserFavorites(),
      child: Scaffold(
        body: BlocConsumer<FavoritesCubit, FavoritesState>(
          listener: (BuildContext context, FavoritesState state) {
            if (state.message != '') {
              showCustomSnackbar(
                context,
                message: state.message,
              );
            }
          },
          builder: (BuildContext context, FavoritesState state) {
            return RefreshIndicator(
              color: Constants.secondaryColor,
              onRefresh: () =>
                  context.read<FavoritesCubit>().getUserFavorites(),
              child: CustomScrollView(
                physics: Constants.bouncingScrollPhysics,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: FavoriteHeader(),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: SwitchTransition(
                      child: switch (state.favoriteStatus) {
                        FavoriteStatus.loading => LoadingStatus(),
                        FavoriteStatus.error => Center(
                            child: Text(state.message),
                          ),
                        FavoriteStatus.success => FavoritesBody(
                            favorites: state.favorites,
                            onDismissed: (String productId) {
                              context
                                  .read<FavoritesCubit>()
                                  .deleteFavoriteProduct(productId: productId);
                            },
                          ),
                        FavoriteStatus.waiting => SizedBox.shrink(),
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
