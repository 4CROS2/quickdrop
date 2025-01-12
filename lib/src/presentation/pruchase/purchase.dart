import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/presentation/pruchase/widgets/purchase_header.dart';

class Purchase extends StatefulWidget {
  const Purchase({
    super.key,
  });

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext _) {
    return BlocProvider<PurchaseCubit>.value(
      value: sl<PurchaseCubit>(),
      child: Scaffold(
        appBar: PruchaseAppBar(),
      ),
    );
  }
}
