import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/cubit/my_purchases_cubit.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/widgets/my_purchases_body.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/widgets/my_purchases_header.dart';

class MyPurchases extends StatefulWidget {
  const MyPurchases({super.key});

  @override
  State<MyPurchases> createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MyPurchasesCubit>(
        create: (BuildContext context) =>
            sl<MyPurchasesCubit>()..getMyPurchases(),
        child: BlocBuilder<MyPurchasesCubit, MyPurchasesState>(
          builder: (BuildContext context, MyPurchasesState state) {
            return CustomScrollView(
              physics: state is Success
                  ? Constants.bouncingScrollPhysics
                  : const NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: MyPurchasesHeader(),
                  pinned: true,
                ),
                if (state is Loading)
                  const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is Error)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(state.message),
                    ),
                  ),
                if (state is Success)
                  SliverPadding(
                    padding: Constants.mainPadding,
                    sliver: MyPurchasesBody(
                      purchases: state.purchases,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
