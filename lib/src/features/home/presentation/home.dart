import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/header/header.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/lastseen/lastseen.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/products/products.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/promotions/promotions.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/sellers/sellers.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/wellcome_message/wellcome_message.dart';
import 'package:quickdrop/src/features/widgets/loading_status.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => sl<HomeCubit>()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return RefreshIndicator(
            onRefresh: () async =>
                await context.read<HomeCubit>().getHomeData(),
            child: CustomScrollView(
              physics: Constants.bouncingScrollPhysics,
              slivers: <Widget>[
                HomeSliverAppBar(),
                WellcomeMessage(),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
