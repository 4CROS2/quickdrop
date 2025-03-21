import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class SellersList extends StatefulWidget {
  const SellersList({super.key});

  @override
  State<SellersList> createState() => _SellersListState();
}

class _SellersListState extends State<SellersList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            borderRadius: Constants.mainBorderRadius*10,
            color: Colors.black26,
            child: SizedBox(
              width: 80,
              height: 80,
            ),
          );
        },
      ),
    );
  }
}
