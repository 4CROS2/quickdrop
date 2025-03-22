import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/sellers_entity.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class SellersList extends StatefulWidget {
  const SellersList({
    required this.sellers,
    super.key,
  });

  final List<SellersEntity> sellers;

  @override
  State<SellersList> createState() => _SellersListState();
}

class _SellersListState extends State<SellersList> {
  @override
  Widget build(BuildContext context) {
    if (widget.sellers.isEmpty) {
      return const SizedBox();
    }
    return SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: Constants.mainPaddingValue,
        ),
        physics: Constants.bouncingScrollPhysics,
        scrollDirection: Axis.horizontal,
        itemCount: widget.sellers.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              right: Constants.mainPaddingValue,
            ),
            child: SizedBox(
              width: 80,
              child: InkWell(
                onTap: () {
                  context.push(
                    '/seller/${widget.sellers[index].sellerId}',
                  );
                },
                borderRadius: Constants.mainBorderRadius,
                child: Column(
                  spacing: Constants.mainPaddingValue,
                  children: <Widget>[
                    Material(
                      borderRadius: Constants.mainBorderRadius * 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.black26,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ImageLoader(
                          imageUrl: widget.sellers[index].image,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.sellers[index].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: .9,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
