import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/my_purchases/cubit/my_purchases_cubit.dart';
import 'package:quickdrop/src/presentation/my_purchases/widgets/my_purchases_body.dart';

class MyPurchases extends StatefulWidget {
  const MyPurchases({super.key});

  @override
  State<MyPurchases> createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          'Mis compras',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider<MyPurchasesCubit>(
        create: (BuildContext context) =>
            sl<MyPurchasesCubit>()..getMyPurchases(),
        child: BlocBuilder<MyPurchasesCubit, MyPurchasesState>(
          builder: (BuildContext context, MyPurchasesState state) {
            return AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              duration: Constants.animationTransition,
              child: switch (state) {
                Error _ => Center(child: Text(state.message)),
                Success _ => MyPurchasesBody(purchases: state.purchases),
                Loading _ => Center(child: CircularProgressIndicator()),
              },
            );
          },
        ),
      ),
    );
  }
}
