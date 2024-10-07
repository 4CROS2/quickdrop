import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/home/cubit/home_cubit.dart';
import 'package:quickdrop/src/prensentation/home/widgets/drawer/drawer.dart';
import 'package:quickdrop/src/prensentation/home/widgets/header/header.dart';
import 'package:quickdrop/src/prensentation/home/widgets/products/products.dart';
import 'package:quickdrop/src/prensentation/home/widgets/promotions/promotions.dart';
import 'package:quickdrop/src/prensentation/widgets/loading_status.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => sl<HomeCubit>()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) => Scaffold(
          drawer: const HomeDrawer(),
          body: AnimatedSwitcher(
            duration: Constants.animationTransition,
            child: switch (state) {
              SuccessHomeData _ => CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: HomeHeader(),
                      pinned: true,
                    ),
                    const SliverToBoxAdapter(
                      child: PromotionsAndDiscounts(),
                    ),
                    Products(
                      products: state.products,
                    )
                  ],
                ),
              ErrorGettingHomeData _ => Center(
                  child: Text(state.message),
                ),
              LoadingHomeData _ => LoadingStatus(),
              _ => SizedBox.shrink()
            },
          ),
        ),
      ),
    );
  }
}
