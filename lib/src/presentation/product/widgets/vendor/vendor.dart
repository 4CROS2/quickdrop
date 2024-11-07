import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/presentation/product/widgets/vendor/widgets/vendor_sheet.dart';

class Vendor extends StatelessWidget {
  const Vendor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Constants.mainPadding.top,
      ),
      child: Material(
        color: Constants.secondaryColor,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: Constants.mainBorderRadius / 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.brandemia.org/wp-content/uploads/2012/04/logo_principal_carulla2.jpg',
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
                      'dasdasdnasjkdjakshjkahfhfhdjhsjkhsjhfashfjsfjshajfkahsdfhhsfjhlshdjhsdlchjkhljkcsha'
                          .capitalize(),
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
