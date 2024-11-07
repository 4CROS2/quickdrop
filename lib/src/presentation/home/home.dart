import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/home/cubit/home_cubit.dart';
import 'package:quickdrop/src/presentation/home/widgets/drawer/drawer.dart';
import 'package:quickdrop/src/presentation/home/widgets/header/header.dart';
import 'package:quickdrop/src/presentation/home/widgets/products/products.dart';
import 'package:quickdrop/src/presentation/home/widgets/promotions/promotions.dart';
import 'package:quickdrop/src/presentation/widgets/loading_status.dart';

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
      child: Scaffold(
        drawer: const HomeDrawer(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<HomeCubit>().getHomeData();
              },
              child: CustomScrollView(
                physics: Constants.bouncingScrollPhysics,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: HomeHeader(),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: AnimatedSwitcher(
                      duration: Constants.animationTransition,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) =>
                          FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: switch (state) {
                        SuccessHomeData _ => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              PromotionsAndDiscounts(),
                              Products(
                                products: state.products,
                              ),
                            ],
                          ),
                        ErrorGettingHomeData _ => Center(
                            child: Text(state.message),
                          ),
                        LoadingHomeData _ => const LoadingStatus(),
                        _ => const SizedBox.shrink()
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
