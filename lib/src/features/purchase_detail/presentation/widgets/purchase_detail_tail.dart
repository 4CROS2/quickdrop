import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/purchase_detail/domain/entity/status_timeline_entity.dart';

class PurchaseStatusTile extends StatelessWidget {
  const PurchaseStatusTile({
    required this.state,
    super.key,
  });

  final StatusTimelineEntity state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.mainPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Constants.mainBorderRadius / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Constants.mainPaddingValue / 2,
        children: <Widget>[
          Text(
            state.status.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
          Text(
            'Updated: ${DateFormat('dd/MM/yyyy HH:mm').format(state.timestamp.toDate())}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
