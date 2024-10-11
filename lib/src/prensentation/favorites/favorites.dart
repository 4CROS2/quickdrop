import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/favorites/cubit/favorites_cubit.dart';
import 'package:quickdrop/src/prensentation/favorites/widgets/favorite_header.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: FavoriteHeader(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: BlocProvider<FavoritesCubit>(
              create: (BuildContext context) => sl<FavoritesCubit>(),
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}
