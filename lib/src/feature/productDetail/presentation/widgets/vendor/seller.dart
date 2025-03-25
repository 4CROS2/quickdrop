import 'package:cached_network_image/cached_network_image.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/feature/home/domain/entity/sellers_entity.dart';
import 'package:quickdrop/src/feature/productDetail/presentation/widgets/vendor/widgets/vendor_sheet.dart';

class Seller extends StatelessWidget {
  const Seller({required SellersEntity seller, super.key}) : _seller = seller;
  final SellersEntity _seller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Constants.mainPadding.top,
      ),
      child: Material(
        color: Colors.black12,
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              enableDrag: true,
              isDismissible: true,
              showDragHandle: true,
              builder: (BuildContext context) => const VendorSheet(),
            );
          },
          child: Padding(
            padding: Constants.mainPadding,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: Constants.mainBorderRadius / 2,
                    child: CachedNetworkImage(
                      imageUrl: _seller.image,
                      fit: BoxFit.cover,
                      errorWidget: (
                        BuildContext context,
                        String url,
                        Object error,
                      ) =>
                          Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: Constants.mainBorderRadius / 2,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.error_outline,
                            ),
                          ),
                        ),
                      ),
                      progressIndicatorBuilder: (
                        BuildContext context,
                        String url,
                        DownloadProgress progress,
                      ) =>
                          CircularProgressIndicator(
                        value: progress.downloaded.toDouble(),
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Constants.mainPadding.left,
                    ),
                    child: Text(
                      _seller.name.capitalize(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
