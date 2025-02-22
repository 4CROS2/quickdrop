import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/entity/status_timeline_entity.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/pruchase/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/presentation/purchase_detail/widgets/purchase_detail_header.dart';
import 'package:quickdrop/src/presentation/purchase_detail/widgets/purchase_product_data.dart';
import 'package:quickdrop/src/presentation/purchase_detail/widgets/purchase_timeline.dart';

class PurchaseDetail extends StatefulWidget {
  const PurchaseDetail({
    required String purchaseId,
    super.key,
  }) : _purchaseId = purchaseId;

  final String _purchaseId;

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PurchaseCubit>(
        create: (BuildContext context) => sl<PurchaseCubit>(),
        child: CustomScrollView(
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
            SliverPadding(
              padding: Constants.mainPadding,
              sliver: PurchaseTimeline(
                statusTimeline: <StatusTimelineEntity>[
                  StatusTimelineEntity(
                    status: OrderStatus.pending,
                    timestamp: Timestamp.now(),
                  ),
                  StatusTimelineEntity(
                    status: OrderStatus.accepted,
                    timestamp: Timestamp.now(),
                  ),
                  StatusTimelineEntity(
                    status: OrderStatus.onTheWay,
                    timestamp: Timestamp.now(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
