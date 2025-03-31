import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/drawer/drawer.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/header/header.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/lastseen/lastseen.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/products/products.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/promotions/promotions.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/sellers/sellers.dart';
import 'package:quickdrop/src/features/widgets/loading_status.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => sl<HomeCubit>()..getHomeData(),
      child: Scaffold(
        drawer: const HomeDrawer(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return RefreshIndicator(
              onRefresh: () async =>
                  await context.read<HomeCubit>().getHomeData(),
              child: CustomScrollView(
                physics: Constants.bouncingScrollPhysics,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: HomeHeader(),
                    pinned: true,
                  ),
                  if (state is LoadingHomeData)
                    SliverFillRemaining(
                      child: const LoadingStatus(),
                    ),
                  if (state is ErrorGettingHomeData)
                    SliverFillRemaining(
                      child: Center(
                        child: Text(state.message),
                      ),
                    ),
                  if (state is SuccessHomeData)
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        <Widget>[
                          PromotionsAndDiscounts(),
                          SizedBox(
                            height: Constants.mainPaddingValue,
                          ),
                          SellersList(
                            sellers: state.home.sellers,
                          ),
                          LastSeen(
                            lastSeenProducts: state.home.lastSeen,
                          ),
                        ],
                      ),
                    ),
                  if (state is SuccessHomeData)
                    Products(
                      products: state.home.products,
                    ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Constants.secondaryColor,
          surfaceTintColor: Constants.secondaryColor,
          selectedIndex: page,
          onDestinationSelected: (int value) {
            setState(() {
              page = value;
              if (value == 1) {
                context.push('/searchpage');
              }
            });
          },
          destinations: <Widget>[
            NavigationDestination(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome10,
                color: Theme.of(context).iconTheme.color!,
              ),
              label: 'inicio',
            ),
            NavigationDestination(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch02,
                color: Theme.of(context).iconTheme.color!,
              ),
              label: 'buscar',
            )
          ],
        ),
      ),
    );
  }
}
