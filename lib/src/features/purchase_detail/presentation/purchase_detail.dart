import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/cubit/purchase_detail_cubit.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/widgets/purchase_detail_header.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/widgets/purchase_product_data.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/widgets/purchase_timeline.dart';

class PurchaseDetail extends StatefulWidget {
  const PurchaseDetail({
    required String orderId,
    required String sellerId,
    super.key,
  })  : _orderId = orderId,
        _sellerId = sellerId;

  final String _orderId;
  final String _sellerId;

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PurchaseDetailCubit>(
        create: (BuildContext context) => sl<PurchaseDetailCubit>()
          ..getPurchaseDetail(
            purchaseId: widget._orderId,
            sellerId: widget._sellerId,
          ),
        child: BlocBuilder<PurchaseDetailCubit, PurchaseDetailState>(
          builder: (BuildContext context, PurchaseDetailState state) {
            return CustomScrollView(
              physics: Constants.bouncingScrollPhysics,
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: PurchaseDetailAppbar(),
                  pinned: true,
                ),
                SliverPadding(
                  padding: Constants.mainPadding,
                  sliver: ProductData(),
                ),
                if (state is Success)
                  SliverPadding(
                    padding: Constants.mainPadding,
                    sliver: PurchaseTimeline(
                      statusTimeline: state.purchaseDetail.statusTimeline,
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
